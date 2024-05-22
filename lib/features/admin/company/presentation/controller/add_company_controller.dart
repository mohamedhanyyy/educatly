import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../get_managers/data/model/get_managers_model.dart';
import '../../domain/usecase/add_company_usecase.dart';
import 'get_companies_controller.dart';

part 'add_company_controller.freezed.dart';
part 'add_company_controller.g.dart';
part 'add_company_state.dart';

@riverpod
class AddCompanyController extends _$AddCompanyController {
  AddCompanyState build() {
    return AddCompanyState(
      searchManagerList: [],
    );
  }

  void clearList() {
    state = state.copyWith(searchManagerList: []);
  }

  void searchCompanyName(String text, List<ManagerModel> managersList) {
    List<ManagerModel> searchList = [];
    managersList.map((element) {
      if (element.userName?.contains(text) == true) {
        searchList.add(element);
      }
    }).toList();

    state = state.copyWith(
        searchManagerList: searchList.isEmpty ? managersList : searchList);
  }

  void setData({
    int? selectedAssigneToIndex,
    ManagerModel? selectedManager,
  }) {
    state = state.copyWith(
      selectedManager: selectedManager ?? state.selectedManager,
      selectedAssigneToIndex:
          selectedAssigneToIndex ?? state.selectedAssigneToIndex,
    );
  }

  Future<AddCompanyState> addCompany({
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
        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      },
      onSuccess: () async {
        await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
        ref.invalidate(getCompaniesControllerProvider);

        AppRouter.router.pop();
      },
    );
    return AddCompanyState();
  }
}
