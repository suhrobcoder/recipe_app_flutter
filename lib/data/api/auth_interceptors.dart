import 'package:dio/dio.dart';

class AuthInterceptors extends Interceptor {
  final String apiKey = "fecbc99e62c542b99f8e9f2532bf959d";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["apiKey"] = apiKey;
    options.headers.addAll({"Content-Type": "application/json"});
    handler.next(options);
  }
}
