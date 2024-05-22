import 'dart:io';

import '../../../../core/services/network/base_response/base_response.dart';
import '../../../shared/auth/login/data/model/auth_response.dart';
import '../../domain/repository/settings_repository.dart';
import '../datasources/settings_remote_request.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteRequest settingsRemoteRequest;

  SettingsRepositoryImpl({required this.settingsRemoteRequest});

  @override
  Future<BaseResponse> updatePassword({
    required String name,
    required String newPass,
    required String currentPass,
  }) {
    return settingsRemoteRequest.changePassword(
      name: name,
      newPass: newPass,
      currentPass: currentPass,
    );
  }

  @override
  Future<AuthResponse> updateProfile({
    File? avatar,
    String? userName,
    String? mobileNumber,
    String? email,
  }) {
    return settingsRemoteRequest.updateProfile(
      avatar: avatar,
      email: email,
      userName: userName,
      mobileNumber: mobileNumber,
    );
  }
}
