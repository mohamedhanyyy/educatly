import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../settings/presentation/controller/settings_controller.dart';
import '../../domain/usecase/reset_password_usecase.dart';

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

    final result = await AsyncValue.guard(
      () => ref.read(resetPasswordUseCaseProvider(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        resetPasswordToken: resetPasswordToken,
      ).future),
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
        try {
          ref.invalidate(settingsControllerProvider);
          await ref.read(settingsControllerProvider.future);
          AppRouter.router.goNamed(AppRoutes.login);
        } catch (e) {
          AppRouter.router.goNamed(AppRoutes.settings);
        }
      },
    );
  }
}
