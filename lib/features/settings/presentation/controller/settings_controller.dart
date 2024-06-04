import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/core/services/dio_helper/error_handler.dart';
import 'package:taskaty/features/shared/auth/login/data/model/auth_response.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../config/l10n/generated/l10n.dart';
import '../../../../core/controllers/button/button_controller.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/services/network/api/network_api.dart';

part 'settings_controller.freezed.dart';
part 'settings_controller.g.dart';
part 'settings_state.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  SettingsState build() {
    return SettingsState(user: PreferencesHelper.getUserModel);
  }

  void setData(AuthResponse user) {
    state = state.copyWith(user: user);
  }

  Future<void> changePassword({
    required Key key,
    required String userName,
    required String newPass,
    required String currentPass,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    Response? response = await DioHelper.postData(
        url: '${Api.changePassword}?userName=$userName',
        data: {
          'newPassword': newPass,
          'currentPassword': currentPass,
        });

    if (response?.statusCode == 200) {
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      AppRouter.router.push(AppRoutes.login);
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      errorHandler(response);
    }
  }

  Future<void> updateProfile({
    required Key key,
    File? avatar,
    String? userName,
    String? email,
    String? mobileNumber,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    final data = FormData.fromMap(
      {
        'FullName': userName,
        'Email': email,
        if (avatar != null)
          "ImageName": await MultipartFile.fromFile(avatar.path,
              filename: avatar.path.split('/').last)
      },
    );
    final response =
        await DioHelper.postData(url: Api.updateProfile, data: data);
    if (response?.statusCode == 200) {
      final authResponse = PreferencesHelper.getUserModel!;
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      final editedUserModel = AuthResponse(
          token: authResponse.token,
          role: authResponse.role,
          id: authResponse.id,
          fullName: response?.data['data']['fullName'],
          email: response?.data['data']['email'],
          firstLogin: authResponse.firstLogin,
          userName: authResponse.userName);
      PreferencesHelper.saveUserModel(userModel: editedUserModel);
      ref.read(settingsControllerProvider.notifier).setData(editedUserModel);
      Toast.showSuccessToast(S().user_updated_successfully);
      AppRouter.router.go(AppRoutes.settings);
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }

  void logout(Key key) {
    PreferencesHelper.logOut();
    AppRouter.router.go(AppRoutes.login);
  }
}
