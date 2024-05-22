import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../../domain/usecase/add_company_usecase.dart';

part 'edit_company_controller.g.dart';

@riverpod
class EditCompanyController extends _$EditCompanyController {
  AddTaskResponse build() {
    return AddTaskResponse();
  }

  Future<AddTaskResponse> editCompany({
    required Key key,
    required String arabicName,
    required String englishName,
    required String address,
    required String managerId,
    required File? companyLogo,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);
    final result = await AsyncValue.guard(() => ref.read(
        addCompanyUseCaseProvider(
                managerId: managerId,
                arabicName: arabicName,
                englishName: englishName,
                logo: companyLogo,
                address: address)
            .future));

    result.handleGuardResults(
      ref: ref,
      onError: () {
        if (AppRouter.router.canPop()) AppRouter.router.pop();
        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      },
      onSuccess: () async {
        await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
        if (AppRouter.router.canPop()) AppRouter.router.pop();
      },
    );
    return AddTaskResponse();
  }
}
