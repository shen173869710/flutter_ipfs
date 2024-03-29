
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/utils/log_util.dart';
import 'package:sp_util/sp_util.dart';
import 'dio_utils.dart';
import 'error_handle.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = SpUtil.getString(GlobalEntiy.accessToken);
    LogUtil.e('accessToken ==='+accessToken!);
    // LogUtil.e("AuthInterceptor  token = "+accessToken!);
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = accessToken;
    }
    // https://developer.github.com/v3/#user-agent-required
    options.headers['User-Agent'] = 'Mozilla/5.0';
    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends Interceptor {
  Dio? _tokenDio;

  Future<String?> getToken() async {
    final Map<String, String> params = <String, String>{};

    params['refresh_token'] = SpUtil.getString(GlobalEntiy.refreshToken)!;
    try {
      _tokenDio ??= Dio();
      _tokenDio!.options = DioUtils.instance.dio.options;
      final Response response = await _tokenDio!.post<dynamic>('lgn/refreshToken', data: params);
      if (response.statusCode == ExceptionHandle.success) {
        return (json.decode(response.data.toString()) as Map<String, dynamic>)['access_token'] as String;
      }
    } catch(e) {
      LogUtil.e('刷新Token失败！');
    }
    return null;
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    //401代表token过期
    if (response != null && response.statusCode == ExceptionHandle.unauthorized) {
      LogUtil.d('-----------自动刷新Token------------');
      final Dio dio = DioUtils.instance.dio;
      dio.lock();
      final String? accessToken = await getToken(); // 获取新的accessToken
      LogUtil.e('-----------NewToken: $accessToken ------------');
      SpUtil.putString(GlobalEntiy.accessToken, accessToken!);
      dio.unlock();

      if (accessToken != null) {
        // 重新请求失败接口
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer $accessToken';

        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );

        try {
          LogUtil.e('----------- 重新请求接口 ------------');
          /// 避免重复执行拦截器，使用tokenDio
          final Response response = await _tokenDio!.request<dynamic>(request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioError catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }
}

class LoggingInterceptor extends Interceptor{

  late DateTime _startTime;
  late DateTime _endTime;
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    LogUtil.e('----------Start----------');
    if (options.queryParameters.isEmpty) {
      LogUtil.e('RequestUrl: ${options.baseUrl}${options.path}');
    } else {
      LogUtil.e('RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    LogUtil.e('RequestMethod: ${options.method}');
    LogUtil.e('RequestHeaders:${options.headers}');
    LogUtil.e('RequestContentType: ${options.contentType}');
    LogUtil.e('RequestData: ${options.data.toString()}');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    LogUtil.e('ResponseCode-------------: ${response.statusCode}');
    if (response.statusCode == ExceptionHandle.success) {
      LogUtil.e('ResponseCode: ${response.statusCode}');
    } else {
      LogUtil.e('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    LogUtil.e(response.data.toString());
    LogUtil.e('----------End: $duration 毫秒----------');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LogUtil.e('----------onError-----------'+err.message);
    LogUtil.e('----------onError-----------'+err.toString());
    super.onError(err, handler);
  }
}

class AdapterInterceptor extends Interceptor{

  static const String _kMsg = 'msg';
  static const String _kSlash = "'";
  static const String _kMessage = 'message';

  static const String _kDefaultText = '无返回信息';
  static const String _kNotFound = '未找到查询信息';

  static const String _kFailureFormat = '{"code":%d,"message":"%s"}';
  static const String _kSuccessFormat = '{"code":0,"data":%s,"message":""}';
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final Response r = adapterData(response);
    super.onResponse(r, handler);
  }
  
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    super.onError(err, handler);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data?.toString() ?? '';
    result =content = content.replaceAll(r'\', '');;
//
//     LogUtil.e("AdapterInterceptor statusCode ="+response.statusCode.toString());
//     /// 成功时，直接格式化返回
    if (response.statusCode == ExceptionHandle.success || response.statusCode == ExceptionHandle.success_not_content) {
      if (content.isEmpty) {
        content = _kDefaultText;
      }
      // result = sprintf(_kSuccessFormat, [content]);
      response.statusCode = ExceptionHandle.success;
    } else {
      if (response.statusCode == ExceptionHandle.not_found) {
        /// 错误数据格式化后，按照成功数据返回
        // result = sprintf(_kFailureFormat, [response.statusCode, _kNotFound]);
        response.statusCode = ExceptionHandle.success;
      } else {
        if (content.isEmpty) {
          // 一般为网络断开等异常
          result = content;
        } else {
          String msg;
          try {
            content = content.replaceAll(r'\', '');
            if (_kSlash == content.substring(0, 1)) {
              content = content.substring(1, content.length - 1);
            }
            final Map<String, dynamic> map = json.decode(content) as Map<String, dynamic>;
            if (map.containsKey(_kMessage)) {
              msg = map[_kMessage] as String;
            } else if (map.containsKey(_kMsg)) {
              msg = map[_kMsg] as String;
            } else {
              msg = '未知异常';
            }
            // result = sprintf(_kFailureFormat, [response.statusCode, msg]);
            // 401 token失效时，单独处理，其他一律为成功
            if (response.statusCode == ExceptionHandle.unauthorized) {
              response.statusCode = ExceptionHandle.unauthorized;
            } else {
              response.statusCode = ExceptionHandle.success;
            }
          } catch (e) {
//            Log.d('异常信息：$e');
            // 解析异常直接按照返回原数据处理（一般为返回500,503 HTML页面代码）
            // result = sprintf(_kFailureFormat, [response.statusCode, '服务器异常(${response.statusCode})']);
          }
        }
      }
    }
    response.data = result;
    return response;
  }
}


