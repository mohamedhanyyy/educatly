import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/config/router/app_router_navigator.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/router/app_router.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../domain/usecase/create_password_usecase.dart';

part 'create_password_controller.g.dart';

@riverpod
class CreatePasswordController extends _$CreatePasswordController {
  void build() {}

  Future<void> createPassword({
    required Key key,
    required String email,
    required String newPassword,
    required String oldPassword,
    required String newPasswordConfirm,
  }) async {
    if (newPassword != newPasswordConfirm) {
      Toast.showToast(S().passwords_doesnt_match);
      return;
    }
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);
    final result = await AsyncValue.guard(
      () => ref.read(createPasswordUseCaseProvider(
              email: email,
              newPassword: newPassword,
              newPasswordConfirm: newPasswordConfirm,
              oldPassword: oldPassword)
          .future),
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
        //todo
        //if there is otp in business, else login screen
        AppRouter.router.pushOtpScreen(email: email);
      },
    );
  }
}
