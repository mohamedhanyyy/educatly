import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';
import 'package:taskaty/features/admin/get_managers/presentation/controller/get_managers_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../domain/usecase/delete_user_usecase.dart';

part 'delete_user_controller.g.dart';

@riverpod
class DeleteUserController extends _$DeleteUserController {
  List<ManagerModel> build() {
    return [ManagerModel()];
  }

  Future<void> deleteUser({
    required String id,
    required Key key,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    final result = await AsyncValue.guard(
      () => ref.read(deleteUserUseCaseProvider(id: id).future),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () async {
        if (AppRouter.router.canPop()) AppRouter.router.pop();
        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      },
      onSuccess: () async {
        await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
        ref.invalidate(getManagersControllerProvider);
        Toast.showToast(S().user_deleted_successfully);
        AppRouter.router.go(AppRoutes.adminHome);
      },
    );
  }
}
