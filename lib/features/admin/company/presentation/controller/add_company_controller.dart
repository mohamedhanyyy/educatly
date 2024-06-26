import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/services/dio_helper/dio_helper.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../get_managers/data/model/get_managers_model.dart';
import 'get_companies_controller.dart';

part 'add_company_controller.freezed.dart';
part 'add_company_controller.g.dart';
part 'add_company_state.dart';

@riverpod
class AddCompanyController extends _$AddCompanyController {
  AddCompanyState build() {
    return const AddCompanyState(
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

  Future<void> addCompany({
    required Key key,
    required String arabicName,
    required String englishName,
    required String address,
    required String managerId,
    required File? companyLogo,
  }) async {
    if (companyLogo == null) {
      Toast.showErrorToast(S().choose_company_image);
      return;
    }
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    final formData = FormData.fromMap({
      "NameAr": arabicName,
      "NameEn": englishName,
      'Address': address,
      "ManagerId": managerId,
      "Logo": await MultipartFile.fromFile(companyLogo.path),
    });

    Response? respone =
        await DioHelper.postData(url: Api.addCompany, data: formData);
    if (respone?.statusCode == 200) {
      await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      ref.invalidate(getCompaniesControllerProvider);
      AppRouter.router.pop();
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }

  Future<void> editCompany({
    required Key key,
    required String arabicName,
    required String englishName,
    required String address,
    required String managerId,
    required File? companyLogo,
  }) async {
    if (companyLogo == null) {
      Toast.showErrorToast(S().choose_company_image);
      return;
    }
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    final formData = FormData.fromMap({
      "NameAr": arabicName,
      "NameEn": englishName,
      'Address': address,
      "ManagerId": managerId,
      "Logo": await MultipartFile.fromFile(companyLogo.path),
    });

    Response? respone =
        await DioHelper.putData(url: Api.editCompany, data: formData);
    if (respone?.statusCode == 200) {
      await ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      ref.invalidate(getCompaniesControllerProvider);
      AppRouter.router.pop();
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }
}
