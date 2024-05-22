import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/config/router/app_router_navigator.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../domain/usecase/forget_password_usecase.dart';

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
    final result = await AsyncValue.guard(
      () => ref.read(forgetPasswordUseCaseProvider(email: email).future),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () async {
        if (AppRouter.router.canPop()) AppRouter.router.pop();
        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
        throw result.error!;
      },
      onSuccess: () async {
        await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
        AppRouter.router.pushOtpScreen(email: email);
      },
    );
  }
}
