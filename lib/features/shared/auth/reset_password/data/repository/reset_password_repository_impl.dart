import '../../../login/data/model/auth_response.dart';
import '../../domain/repository/reset_password_repository.dart';
import '../datasources/reset_password_remote_request.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteRequest resetPasswordRemoteRequest;

  ResetPasswordRepositoryImpl({required this.resetPasswordRemoteRequest});

  @override
  Future<AuthResponse> resetPassword({
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final String resetPasswordToken,
  }) async {
    return resetPasswordRemoteRequest.resetPassword(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      resetPasswordToken: resetPasswordToken,
    );
  }
}
