import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/services/network/base_response/base_response.dart';
import '../../../shared/auth/login/data/model/auth_response.dart';

part 'settings_remote_request.g.dart';

abstract class SettingsRemoteRequest {
  Future<AuthResponse> updateProfile({
    File? avatar,
    String? userName,
    String? email,
    String? mobileNumber,
  });

  Future<BaseResponse> changePassword({
    required String name,
    required String newPass,
    required String currentPass,
  });
}

@riverpod
SettingsRemoteRequest settingsRemoteRequest(SettingsRemoteRequestRef ref) {
  return SettingsRemoteRequestImpl();
}

class SettingsRemoteRequestImpl implements SettingsRemoteRequest {
  @override
  Future<AuthResponse> updateProfile({
    File? avatar,
    String? userName,
    String? email,
    String? mobileNumber,
  }) async {
    late AuthResponse userResponse;

    await NetworkRequest.instance.requestDataFuture<AuthResponse>(
      method: Method.post,
      url: Api.updateProfile,
      onError: (code, msg) => Toast.showToast(msg),
      params: FormData.fromMap(
        {
          'name': userName,
          'phoneNumber': mobileNumber,
          'email': email,
          if (avatar != null)
            "image": await MultipartFile.fromFile(
              avatar.path,
              filename: avatar.path.split('/').last,
            ),
        },
      ),
      onSuccess: (getUserResponse) async {
        userResponse = getUserResponse;
      },
    );
    return userResponse;
  }

  @override
  Future<BaseResponse> changePassword({
    required String name,
    required String newPass,
    required String currentPass,
  }) async {
    late BaseResponse response;
    await NetworkRequest.instance.requestDataFuture<BaseResponse>(
      method: Method.post,
      url: '${Api.changePassword}?userName=$name',
      onError: (code, msg) => Toast.showToast(msg),
      onSuccess: (data) {
        response = data;
      },
      params: {
        'newPassword': newPass,
        'currentPassword': currentPass,
        'UserToken':await FirebaseMessaging.instance.getToken(),

      },
    );
    return response;
  }
}
