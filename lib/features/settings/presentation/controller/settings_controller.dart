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
import '../../../../core/controllers/button/button_controller.dart';
import '../../../../core/services/network/api/network_api.dart';

part 'settings_controller.freezed.dart';
part 'settings_controller.g.dart';
part 'settings_state.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  Future<SettingsState> build() async {
    return await SettingsState();
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
      AppRouter.router.pop();
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
        'name': userName,
        'email': email,
        if (avatar != null)
          "image": await MultipartFile.fromFile(
            avatar.path,
            filename: avatar.path.split('/').last,
          ),
      },
    );
    Response? response =
        await DioHelper.postData(url: Api.updateProfile, data: data);

    if (response?.statusCode == 200) {
      AuthResponse authResponse = PreferencesHelper.getUserModel!;
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      print(response?.data['data']['fullName']);
      print(response?.data['data']['email']);
      await PreferencesHelper.saveUserModel(
          userModel: AuthResponse(
        token: authResponse.token,
        role: authResponse.role,
        id: authResponse.id,
        fullName: response?.data['data']['fullName'],
        email: response?.data['data']['email'],
        firstLogin: authResponse.firstLogin,
        userName: authResponse.userName,
      ));
    } else {
      print(response?.statusMessage);
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }

  Future<void> logout(Key key) async {
    PreferencesHelper.logOut();

    AppRouter.router.go(AppRoutes.login);
  }
}
