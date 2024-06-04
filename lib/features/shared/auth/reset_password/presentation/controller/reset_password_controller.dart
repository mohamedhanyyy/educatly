import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../settings/presentation/controller/settings_controller.dart';

part 'reset_password_controller.g.dart';

@riverpod
class ResetPasswordController extends _$ResetPasswordController {
  @override
  void build() {}

  Future<void> resetPassword({
    required Key key,
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final String resetPasswordToken,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    Response? response =
        await DioHelper.postData(url: Api.resetPassword, data: {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    });
    if (response?.statusCode == 200) {
      await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);

      ref.invalidate(settingsControllerProvider);
      AppRouter.router.goNamed(AppRoutes.login);
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }
}
