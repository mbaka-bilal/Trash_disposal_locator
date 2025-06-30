import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../constants/strings.dart';
import 'exceptions.dart';

class ApiExceptionHandler {
  static ApiException handleException(Object e) {
    String message = AppStrings.somethingWentWrong;

    if (e is DioException) {
      final serverError = e.response?.data;

      if (serverError is Map<String, dynamic>) {
        final errorMessage = serverError['message'] as String?;

        if (errorMessage != null) {
          message = errorMessage;
        }
      }

      switch (e.type) {
        case DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioExceptionType.receiveTimeout:
          message = AppStrings.connectionTimeout;
          break;
        case DioExceptionType.unknown:
          message = AppStrings.somethingWentWrong;
          break;
        default:
          message = AppStrings.somethingWentWrong;
          break;
      }
    }

    if (e is TimeoutException || e is SocketException) {
      message = AppStrings.connectionTimeout;
    }

    return ApiException(message: message);
  }
}
