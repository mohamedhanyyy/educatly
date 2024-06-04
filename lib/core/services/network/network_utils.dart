import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../config/router/app_router.dart';
import '../../../config/router/app_routing_paths.dart';
import '../../helpers/toast_helper.dart';
import '../database/preferences_helper.dart';
import 'api/network_api.dart';
import 'api/status_code.dart';
import 'base_response/base_response.dart';
import 'base_response/network_constant.dart';
import 'exception/exception_handle.dart';
import 'exception/exceptions.dart';
import 'interceptors.dart';

enum Method { get, post, put, delete }

Map<String, dynamic> parseData(String data) => json.decode(data);

Map<String, dynamic> headers = {
  "Accept": "application/json",
  'Content-Type': 'application/json',
};

class NetworkRequest {
  factory NetworkRequest() => _singleInstance;

  static NetworkRequest get instance => NetworkRequest();

  static final NetworkRequest _singleInstance = NetworkRequest._internal();

  Dio? _dio;
  BaseOptions? _options;
  Options defaultOptions = Options(headers: headers);

  NetworkRequest._internal() {
    _options = BaseOptions(
      headers: headers,
      baseUrl: Api.mainAppUrl,
      responseType: ResponseType.plain,
      validateStatus: (status) => true,
      connectTimeout: const Duration(milliseconds: 15000),
      receiveTimeout: const Duration(milliseconds: 15000),
    );
    _dio = Dio(_options);
    _dio!.interceptors.add(RequestsInspectorInterceptor());
  }

  Future<BaseResponse<T>> _request<T>(
    String method,
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    options?.headers = headers;

    headers['authorization'] = 'Bearer ${PreferencesHelper.getToken}';

    final response = await _dio!.request(
      url,
      data: data,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
      options: _setOptions(method, options),
    );
    try {
      Map<String, dynamic> map =
          await compute(parseData, response.data.toString());
      map[NetworkConstant.code] = response.statusCode;
      return BaseResponse<T>.fromJson(map);
    } catch (e) {
      final data = jsonDecode(response.data)['data'];
      final errors = jsonDecode(response.data)['errors'];
      debugPrint("==============>" + jsonDecode(response.data)['errors']);
      return BaseResponse(data, response.statusCode, errors);
    }
  }

  Future requestDataFuture<T>({
    dynamic params,
    Options? options,
    bool isList = false,
    required String url,
    required Method method,
    Function(T t)? onSuccess,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
    Function(List<T> list)? onSuccessList,
    Function(int code, String msg)? onError,
  }) async {
    String requestMethod = method.name.toUpperCase();
    return await _request<T>(
      requestMethod,
      url,
      data: params,
      cancelToken: cancelToken,
      options: options ?? Options(),
      queryParameters: queryParameters,
    ).then((BaseResponse<T> result) async {
      if (result.code == StatusCode.success ||
          result.code == StatusCode.created ||
          result.code == StatusCode.updated) {
        if (onSuccessList != null) {
          await onSuccessList(result.listData!);
        }
        if (onSuccess != null) {
          await onSuccess((result.data ?? result) as T);
        }
      } else {
        if (result.code == StatusCode.unauthenticated) {
          AppRouter.router.goNamed(AppRoutes.login);
          throw (UnAuthorizedException());
        } else if (result.code == StatusCode.badRequest) {
        } else if (result.code == StatusCode.tooManyAttempts) {
          showDialog(
            barrierDismissible: false,
            context: AppRouter.navigatorState.currentContext!,
            builder: (BuildContext context) {
              return const SizedBox.shrink();
              // return TooManyAttemptsView(message: result.message ?? "");
            },
          );
        } else if (result.code == StatusCode.notFound) {
          debugPrint(result.errors.toString());
          Toast.showToast(result.errors.toString());
        } else if (result.code == StatusCode.serviceUnavailable) {
          throw (ServerException(
              message:
                  "We Are in Deployment Mode now!\nPlease Try app later."));
        } else if (result.code == StatusCode.conflict) {
          throw UnRegisteredSocialException(
            message: result.message ?? '',
          );
        } else if (result.code! >= StatusCode.internalServerError &&
            result.code! <= 599) {
          throw UnRegisteredSocialException(
            message: result.message ?? '',
          );
        } else if (result.code! >= 1000 && result.code! <= 1999) {
        } else if (result.code == StatusCode.validationResponse) {
          throw UnRegisteredSocialException(
            message: result.message ?? '',
          );
        }
        throw ServerException(message: result.message ?? '');
      }
    }, onError: (e) {
      NetError error = ExceptionHandle.handleException(e);
      if (error.code == StatusCode.timeoutError) {
        throw (
          ServerException(message: "Connection Timeout\nPlease try app later."),
        );
      }
    });
  }

  Options _setOptions(String method, Options? options) {
    options!.method = method;
    return options;
  }
}
