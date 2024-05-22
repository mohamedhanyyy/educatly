import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../data/model/user_type_model.dart';
import '../../../domain/usecase/super_admin_usecase.dart';

part 'admin_controller.freezed.dart';
part 'admin_controller.g.dart';
part 'admin_state.dart';

@riverpod
class AdminController extends _$AdminController {
  AdminState build() {
    return AdminState();
  }

  void setData({
    String? name,
    String? fullName,
    String? email,
    String? password,
    UserTypeModel? userTypeModel,
    int? companyId,
    String? companyName,
  }) {
    state = state.copyWith(
      name: state.name ?? name,
      email: state.email ?? email,
      userType: state.userType ?? userTypeModel,
      companyName: companyName,
      fullName: state.fullName ?? fullName,
      password: state.password ?? password,
      companyId: state.companyId ?? companyId,
    );
  }

  Future<void> addUser({
    required String userName,
    required String fullName,
    required String email,
    required String password,
    required UserTypeModel? userTypeModel,
    required Key key,
  }) async {
     
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);
    final result = await AsyncValue.guard(
      () => ref.read(superAdminUseCaseProvider(
              email: email,
              password: password,
              userName: userName,
              role: state.userType!.id,
              fullName: fullName)
          .future),
    );

    result.handleGuardResults(
      ref: ref,
      onError: () async {
        if (AppRouter.router.canPop()) AppRouter.router.pop();
        debugPrint(result.error.toString());

        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      },
      onSuccess: () async {
        await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
        AppRouter.router.go(AppRoutes.settings);
        debugPrint('SUCCESS ${result.requireValue}');
      },
    );
  }
}
