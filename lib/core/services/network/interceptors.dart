import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/config/router/app_routing_paths.dart';
import 'package:taskaty/core/services/network/base_response/base_response.dart';

import '../../../config/l10n/generated/l10n.dart';
import '../../helpers/toast_helper.dart';

class RequestsInspectorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final urlAndQueryParMapEntry = _extractUrl(response.requestOptions);
    final url = urlAndQueryParMapEntry.key;
    final queryParameters = urlAndQueryParMapEntry.value;

    InspectorController().addNewRequest(
      RequestDetails(
        requestMethod: RequestMethod.values
            .firstWhere((e) => e.name == response.requestOptions.method),
        url: url,
        statusCode: response.statusCode ?? 0,
        headers: response.requestOptions.headers,
        queryParameters: queryParameters,
        requestBody: response.requestOptions.data,
        responseBody: jsonDecode(response.data),
        sentTime: DateTime.now(),
      ),
    );

    debugPrint('STATUS CODE ${response.statusCode}');
    debugPrint('DATA ${response.data}');
    debugPrint('STATUS MESSAGE ${response.statusMessage}');
    if (response.statusCode == 401) {
      Toast.showErrorToast(S().login_again);
      AppRouter.router.pushNamed(AppRoutes.login);
    }
    // if (response.statusCode != 200 &&
    //     response.statusCode != 201 &&
    //     response.statusCode != 202) {
    BaseResponse errors = BaseResponse.fromJson(jsonDecode(response.data));
    debugPrint('ERRORS ERRORS ${errors.errors.length}');
    if (errors.errors.isNotEmpty == true)
      Toast.showErrorToast(errors.errors.first);
    // }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final urlAndQueryParMapEntry = _extractUrl(err.requestOptions);
    debugPrint('ON-ERROR  ${urlAndQueryParMapEntry.value}');
    final url = urlAndQueryParMapEntry.key;
    final queryParameters = urlAndQueryParMapEntry.value;
    InspectorController().addNewRequest(
      RequestDetails(
        requestMethod: RequestMethod.values
            .firstWhere((e) => e.name == err.requestOptions.method),
        url: url,
        sentTime: DateTime.now(),
        queryParameters: queryParameters,
        headers: err.requestOptions.headers,
        requestBody: err.requestOptions.data,
        responseBody: err.message ?? err.error,
      ),
    );
    super.onError(err, handler);
  }

  MapEntry<String, Map<String, dynamic>> _extractUrl(
    RequestOptions requestOptions,
  ) {
    final splitUri = requestOptions.uri.toString().split('?');
    final baseUrl = splitUri.first;
    final builtInQuery = splitUri.length > 1 ? splitUri.last : null;
    final buildInQueryParamsList = builtInQuery?.split('&').map((e) {
      final split = e.split('=');
      return MapEntry(split.first, split.last);
    }).toList();
    final builtInQueryParams = buildInQueryParamsList == null
        ? null
        : Map.fromEntries(buildInQueryParamsList);
    final queryParameters = {
      ...?builtInQueryParams,
      ...requestOptions.queryParameters
    };
    return MapEntry(baseUrl, queryParameters);
  }
}
