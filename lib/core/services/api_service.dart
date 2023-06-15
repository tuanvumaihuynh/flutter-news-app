import 'package:dio/dio.dart';

class ApiService {
  ApiService({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    // data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.request(
      url,
      // data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.name.toUpperCase(),
        headers: headers,
      ),
    );
  }
}

enum RequestMethod {
  get,
  post,
  put,
  delete,
}
