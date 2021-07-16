import 'package:dio/dio.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('send request：path:${options.path}，baseURL:${options.baseUrl}');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

  }


}