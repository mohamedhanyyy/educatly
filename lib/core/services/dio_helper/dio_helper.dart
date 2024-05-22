import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../network/api/network_api.dart';

class DioHelper {
  static BaseOptions opts = BaseOptions(
    baseUrl: Api.mainAppUrl,
    headers: {
      "Accept": "application/json",
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${PreferencesHelper.getUserModel?.token}'
    },
    receiveDataWhenStatusError: true,
    followRedirects: false,
    validateStatus: (status) {
      return status! <= 500;
    },
  );

  static Dio init() => Dio(opts);

  static Dio? dio = init();

  static Future<Response?> postData({required String url, data}) async {
    String? token = PreferencesHelper.getUserModel?.token;
    try {
      Response? response = await dio?.post(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: data);
      log('RESPONSE STATUS CODE:${response?.statusCode}');
      log('RESPONSE DATA:${response?.data}');
      log('RESPONSE REQUEST OPTIONS:${response?.requestOptions.data}');

      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> putData({required String url, data}) async {
    String? token = PreferencesHelper.getUserModel?.token;
    try {
      Response? response = await dio?.put(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: data);
      log('RESPONSE STATUS CODE:${response?.statusCode}');
      log('RESPONSE DATA:${response?.data}');
      log('RESPONSE REQUEST OPTIONS:${response?.requestOptions.data}');

      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> getData(
      {required String url, Map<String, dynamic>? data}) async {
    String? token = PreferencesHelper.getUserModel?.token;

    try {
      Response? response = await dio?.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: data);
      log('RESPONSE STATUS CODE:${response?.headers}');
      log('RESPONSE DATA:${response?.data}');
      log('RESPONSE REQUEST OPTIONS:${response?.requestOptions.data}');

      return response;
    } catch (e) {
      log('$e');

      return e is DioException ? e.response : null;
    }
  }
}
