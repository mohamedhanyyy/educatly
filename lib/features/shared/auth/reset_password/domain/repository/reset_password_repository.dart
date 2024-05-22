import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../login/data/model/auth_response.dart';
import '../../data/datasources/reset_password_remote_request.dart';
import '../../data/repository/reset_password_repository_impl.dart';

part 'reset_password_repository.g.dart';

@riverpod
ResetPasswordRepository resetPasswordRepository(
    ResetPasswordRepositoryRef ref) {
  return ResetPasswordRepositoryImpl(
    resetPasswordRemoteRequest: ref.read(resetPasswordRemoteRequestProvider),
  );
}

abstract class ResetPasswordRepository {
  Future<AuthResponse> resetPassword({
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final String resetPasswordToken,
  });
}
