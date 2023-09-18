import 'package:dio/dio.dart';
import 'package:jsonflutter/environment.dart';

class Requester {
  Dio Client() {
    Dio client = Dio();
    client.interceptors.add(ApiInterceptor());
    client.options.baseUrl = Environment().config.serviceApi;

    return client;
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType ??= "application/json";
    handler.next(options);
  }
}
