import 'dart:io';

import 'package:dio/dio.dart';

import '../api/status_code.dart';

class ExceptionHandle {
  static String globalError = "Please check internet connection";
  static String timeoutError = "Connection Timeout";

  static NetError handleException(dynamic error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.unknown ||
          error.type == DioExceptionType.badResponse) {
        dynamic e = error.error;

        ///socket error
        if (e is SocketException) {
          return NetError(StatusCode.socketError, globalError);
        }

        ///http connection error `
        if (e is HttpException) {
          return NetError(StatusCode.serverError, globalError);
        }
        //
        return NetError(StatusCode.networkError, globalError);

        ///connection time out error
      } else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return NetError(StatusCode.timeoutError, timeoutError);

        ///cancel request error
      } else if (error.type == DioExceptionType.cancel) {
        return NetError(StatusCode.cancelError, "");

        ///unhandled exception
      } else {
        return NetError(StatusCode.unknownError, globalError);
      }
    } else {
      return NetError(StatusCode.unknownError, globalError);
    }
  }
}

class NetError {
  int code;
  String msg;

  NetError(this.code, this.msg);
}
