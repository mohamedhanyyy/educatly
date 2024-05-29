import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/config/router/app_router_navigator.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../../core/services/network/api/network_api.dart';

part 'forget_password_controller.g.dart';

@riverpod
class ForgetPasswordController extends _$ForgetPasswordController {
  @override
  void build() {}

  Future<void> forgetPassword({
    required Key key,
    required String email,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);
    Response? response = await DioHelper.postData(
        url: Api.forgetPassword, data: {'email': email});
    if (response?.statusCode == 200) {
      await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      AppRouter.router.pushOtpScreen(email: email);
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }
}
