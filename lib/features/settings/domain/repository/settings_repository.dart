import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/base_response/base_response.dart';
import '../../../shared/auth/login/data/model/auth_response.dart';
import '../../data/datasources/settings_remote_request.dart';
import '../../data/repository/settings_repository_impl.dart';

part 'settings_repository.g.dart';

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return SettingsRepositoryImpl(
    settingsRemoteRequest: ref.read(settingsRemoteRequestProvider),
  );
}

abstract class SettingsRepository {
  Future<AuthResponse> updateProfile({
    File? avatar,
    String? userName,
    String? email,
    String? mobileNumber,
  });

  Future<BaseResponse> updatePassword({
    required String newPass,
    required String name,
    required String currentPass,
  });
}
