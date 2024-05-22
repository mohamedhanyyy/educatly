import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/auth/login/data/model/auth_response.dart';
import '../repository/settings_repository.dart';

part 'update_profile_usecase.g.dart';

@riverpod
Future<AuthResponse> updateProfileUseCase(
  UpdateProfileUseCaseRef ref, {
  File? avatar,
  String? userName,
  String? mobileNumber,
  String? email,
}) {
  return ref.read(settingsRepositoryProvider).updateProfile(
      avatar: avatar,
      userName: userName,
      mobileNumber: mobileNumber,
      email: email);
}
