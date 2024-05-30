import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/admin/get_managers/presentation/controller/get_managers_controller.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/router/app_router.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../add_task/presentation/widgets/add_task_done_bottomsheet.dart';
import '../../../data/model/user_type_model.dart';

part 'super_admin_controller.freezed.dart';
part 'super_admin_controller.g.dart';
part 'super_admin_state.dart';

@riverpod
class SuperAdminController extends _$SuperAdminController {
  SuperAdminState build() {
    return SuperAdminState();
  }

  void setData({
    String? name,
    String? email,
    UserTypeModel? userTypeModel,
  }) {
    state = state.copyWith(
      name: state.name ?? name,
      email: state.email ?? email,
      userType: state.userType ?? userTypeModel,
    );
  }

  Future<void> addUser({
    required String userName,
    String? fullName,
    required String email,
    required UserTypeModel? userTypeModel,
    required Key key,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    Response? response = await DioHelper.postData(url: Api.registerUser, data: {
      "userName": userName,
      'fullName': fullName,
      "email": email,
      "role": userTypeModel?.id,
      'companyId': 0,
    });

    if (response?.statusCode == 201) {
      await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);

      showModalBottomSheet(
          context: AppRouter.navigatorState.currentContext!,
          builder: (context) {
            return DoneBottomSheet(message: S().user_added_successfully);
          });
      ref.invalidate(getManagersControllerProvider);
    } else
      await ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
  }
}
