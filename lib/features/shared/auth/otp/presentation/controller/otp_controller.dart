import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/config/router/app_router_navigator.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../domain/usecase/resend_otp_usecase.dart';
import '../../domain/usecase/verify_otp_usecase.dart';

part 'otp_controller.g.dart';

@riverpod
class OtpController extends _$OtpController {
  @override
  void build() {}

  Future<void> verifyOTP({
    required Key key,
    required String otp,
    required String email,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    final result = await AsyncValue.guard(
      () => ref.read(verifyOtpUseCaseProvider(email: email, otp: otp).future),
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
        AppRouter.router.pushResetPasswordScreen(
          email: email,
          resetToken: result.requireValue.resetToken,
        );
      },
    );
  }

  Future<void> resendOTP({required String email}) async {
    final result = await AsyncValue.guard(
      () => ref.read(resendOtpUseCaseProvider(email: email).future),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () async {
        throw result.error!;
      },
      onSuccess: () async {
        Toast.showToast("Otp was send");
      },
    );
  }
}
