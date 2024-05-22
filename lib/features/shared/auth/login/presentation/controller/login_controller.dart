import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../settings/presentation/controller/settings_controller.dart';
import '../../domain/usecase/login_usecase.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  void build() {}

  Future<void> login({
    required Key key,
    required String email,
    required String password,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);
    final result = await AsyncValue.guard(
      () => ref.read(loginUseCaseProvider(
        username: email,
        password: password,
      ).future),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () async {
        if (AppRouter.router.canPop()) AppRouter.router.pop();
        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      },
      onSuccess: () async {
        ref.invalidate(settingsControllerProvider);
        await ref.read(settingsControllerProvider.future);
        await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);

        if (result.requireValue.firstLogin == true) {
          AppRouter.router.go(AppRoutes.createPassword);
        } else if (result.requireValue.role == 'SystemAdmin') {
          AppRouter.router.go(AppRoutes.adminHome);
        } else {
          AppRouter.router.go(AppRoutes.managerHome);
        }
      },
    );
  }
}
