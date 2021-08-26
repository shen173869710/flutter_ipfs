import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:ipfsnets/generated/l10n.dart';

import 'package:ipfsnets/http/url_config.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/net/error_handle.dart';
import 'package:ipfsnets/net/intercept.dart';
import 'package:ipfsnets/utils/LoadingUtils.dart';
import 'package:ipfsnets/utils/log_util.dart';
export '../../../r.dart';
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
    try {
      if (params != null) {
        response = await _dio!.get(api,queryParameters: params);
      }else{
        response = await _dio!.get(api);
      }
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      final String data = response.data.toString();
        // LogUtil.e("请求结束"+data);
      final Map<String, dynamic> _map = parseData(data);
      return BaseEntity<T>.fromJson(_map);
    } on Exception  catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      LogUtil.e("get 异常"+e.toString());
      return parseException(e);
    }

  }

  ///通用的POST请求
  Future<BaseEntity<T>> post<T>(api,  String json,{withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show();
    }

    Response response;
    try {
      response = await _dio!.post(api, data: json);
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      final String data = response.data.toString();
      LogUtil.e("请求结束---------"+data);
      final Map<String, dynamic> _map = parseData(data);
      return BaseEntity<T>.fromJson(_map);
    } on Exception catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      LogUtil.e("解析异常"+e.toString());
      return parseException(e);
    }

  }


  Future<BaseEntity<T>> del<T>(api,  String json,{withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show();
    }
    Response response;
    try {
      response = await _dio!.request(api, data: json,options:new Options(method: 'delete') );
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      final String data = response.data.toString();
      LogUtil.e("请求结束"+data);
      final Map<String, dynamic> _map = parseData(data);
      return BaseEntity<T>.fromJson(_map);
    } on Exception catch (e) {
      if (withLoading) {
        LoadingUtils.dismiss();
      }
      return parseException(e);
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
      ///通过FormData
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(path, filename: name,),
      });
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
parseException(Exception error) {
  int? errCode = -1;
  String message = "";
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        message = S.current.no_network;
        break;
      // // case DioErrorType.cancel:
      // //   return CancelException(error.error.message);
      // case DioErrorType.response:
      //   try {
      //     errCode = error.response?.statusCode;
      //     switch (errCode) {
      //       case 400:
      //         return BadRequestException(message: "请求语法错误", code: errCode);
      //       case 401:
      //         return UnauthorisedException(message: "没有权限", code: errCode);
      //       case 403:
      //         return BadRequestException(message: "服务器拒绝执行", code: errCode);
      //       case 404:
      //         return BadRequestException(message: "无法连接服务器", code: errCode);
      //       case 405:
      //         return BadRequestException(message: "请求方法被禁止", code: errCode);
      //       case 500:
      //         return BadServiceException(message: "服务器内部错误", code: errCode);
      //       case 502:
      //         return BadServiceException(message: "无效的请求", code: errCode);
      //       case 503:
      //         return BadServiceException(message: "服务器挂了", code: errCode);
      //       case 505:
      //         return UnauthorisedException(
      //             message: "不支持HTTP协议请求", code: errCode);
      //       default:
      //         return UnknownException(error.error.message);
      //     }
      //   } on Exception catch (_) {
      //     return UnknownException(error.error.message);
      //   }

      case DioErrorType.other:
        message = S.current.no_network;
        break;
      default:
      message = S.current.no_network;
       break;
    }
  }
  return BaseEntity(errCode, message, null);
}

