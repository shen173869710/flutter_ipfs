import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ipfsnets/data/global_entiy.dart';
import 'package:ipfsnets/http/result_data.dart';
import 'package:ipfsnets/http/url_config.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/net/error_handle.dart';
import 'package:ipfsnets/net/intercept.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';
import 'package:dio/src/response.dart';
import 'package:ipfsnets/utils/log_util.dart';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();
  Dio? _dio;
  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;
  factory HttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpManager._internal() {
    if (null == _dio) {
      _dio = new Dio(BaseOptions(baseUrl: UrtConfig.BASE_URL, connectTimeout: 15000,contentType:Headers.jsonContentType,responseType: ResponseType.plain,));
      _dio!.interceptors.add(new LoggingInterceptor());
      _dio!.interceptors.add(new AdapterInterceptor());
      _dio!.interceptors.add(new AuthInterceptor());
    }
  }

  static HttpManager getInstance({String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  //用于指定特定域名
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio!.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio!.options.baseUrl != UrtConfig.BASE_URL) {
        _dio!.options.baseUrl = UrtConfig.BASE_URL;
      }
    }
    return this;
  }

  ///通用的GET请求
  Future<BaseEntity<T>> get<T>(api, {Map<String, dynamic>? params,withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    Response response;
    int code = 0;
    try {
      if (params != null) {
        response = await _dio!.get(api,queryParameters: params);
      }else{
        response = await _dio!.get(api);
      }
      if (withLoading) {
        LoadingUtils.dismiss();
      }

      code = response.statusCode!;
      if(code == 200) {
        final String data = response.data.toString();
        // LogUtil.e("请求结束"+data);
        final Map<String, dynamic> _map = parseData(data);
        return BaseEntity<T>.fromJson(_map);
      }

    }  catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      LogUtil.e("异常"+e.toString());
      code = -1;
      return BaseEntity(code, e.toString(), null);
      // return resultError(e);
    }
    return BaseEntity(code, '数据解析错误！', null);
  }

  ///通用的POST请求
  Future<BaseEntity<T>> post<T>(api,  String json,{withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    int code = 0;
    Response response;
    try {
      response = await _dio!.post(api, data: json);
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      code = response.statusCode!;
      final String data = response.data.toString();
      LogUtil.e("请求结束"+data);
      final Map<String, dynamic> _map = parseData(data);

      return BaseEntity<T>.fromJson(_map);
    } catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      LogUtil.e("解析异常"+e.toString());
      code = -1;
      return BaseEntity(code, e.toString(), null);
    }
    return BaseEntity(ExceptionHandle.parse_error, '数据解析错误！', null);
  }


  Future<BaseEntity<T>> del<T>(api,  String json,{withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    int code = 0;
    Response response;
    try {
      response = await _dio!.request(api, data: json,options:new Options(method: 'delete') );
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      code = response.statusCode!;
      final String data = response.data.toString();
      LogUtil.e("请求结束"+data);
      final Map<String, dynamic> _map = parseData(data);
      return BaseEntity<T>.fromJson(_map);
    } catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      code = -1;
      return BaseEntity(code, e.toString(), null);
    }

  }

  Future<BaseEntity<T>> upload<T>(api, File file, {withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    try {
      String path = file.path;
      var name = path.substring(path.lastIndexOf("/") + 1, path.length);

      print("文件路径=" + path);
      print("文件名=" + name);
      Map<String, dynamic> map = Map();
      map["file"] = await MultipartFile.fromFile(path, filename: name);
      ///通过FormData
      FormData formData = FormData.fromMap(map);
      ///发送post
      Response response;
      response = await _dio!.post(api, data: formData,
        onSendProgress: (int progress, int total) {
          // print("当前进度是 $progress 总进度是 $total");
        },
      );

      ///服务器响应结果
      final String data = response.data.toString();
      final Map<String, dynamic> _map = parseData(data);
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      return BaseEntity<T>.fromJson(_map);
    } catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    }
    return BaseEntity(ExceptionHandle.parse_error, '请求异常', null);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}
ResultData resultError(DioError e) {
  Response errorResponse;
  int code = 200;
  if (e.response != null) {
    errorResponse = e.response!;
  } else {
    code = 404;
  }
  if (e.type == DioErrorType.connectTimeout ||
      e.type == DioErrorType.receiveTimeout) {
    code = 444;
  }
  return new ResultData("error", false, code);
}
