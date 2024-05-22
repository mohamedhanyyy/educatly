import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../login/data/model/auth_response.dart';
import '../repository/reset_password_repository.dart';

part 'reset_password_usecase.g.dart';

@riverpod
Future<AuthResponse> resetPasswordUseCase(
  ResetPasswordUseCaseRef ref, {
  required final String email,
  required final String password,
  required final String confirmPassword,
  required final String resetPasswordToken,
}) {
  return ref.read(resetPasswordRepositoryProvider).resetPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        resetPasswordToken: resetPasswordToken,
      );
}
