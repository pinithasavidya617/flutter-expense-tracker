
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://10.0.2.2:8000/',
          connectTimeout: const Duration( seconds: 60),
          receiveTimeout: const Duration( seconds: 60),
          headers: {
            "Content-Type" : "application/json"
          }
      ),
    );
    _initializeInterceptors();

  }

  void _initializeInterceptors() {
    dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: ( options , handler ) {
              print("REQUEST[${options.method}] => PATH : ${options.path}");
              return handler.next(options);
            },
            onResponse: ( response , handler ) {
              print("RESPONSE[${response.statusCode}] => DATA : ${response.data}");
              return handler.next(response);
            },
            onError: ( error , handler ) {
              print("ERROR[${error.response?.statusCode}] => MESSAGE : ${error.message}");
              return handler.next(error);
            }
        )
    );
  }

  Future<Response> get(String url, {Map<String , dynamic>? queryParams}) async {
    return await dio.get(url , queryParameters: queryParams);
  }


  Future<Response> post(String url, {dynamic data}) async {
    return await dio.post(url , data: data);
  }
}