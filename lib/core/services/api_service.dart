import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app_config.dart';
import '../errors/exception_handler.dart';

class ApiService {
  ApiService({this.dio, this.baseUrl}) {
    _dio = dio ?? Dio();

    _dio.options.baseUrl = baseUrl ?? AppConfig.url;
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    //TODO: add interceptors
    _dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ),
    ]);
  }

  Dio _dio = Dio();

  final Dio? dio;
  final String? baseUrl;

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      throw AppExceptionHandler.handleException(e);
    }
  }
}
