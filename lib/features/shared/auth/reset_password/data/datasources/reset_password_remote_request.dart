import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/network_utils.dart';
import '../../../login/data/model/auth_response.dart';

part 'reset_password_remote_request.g.dart';

abstract class ResetPasswordRemoteRequest {
  Future<AuthResponse> resetPassword({
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final String resetPasswordToken,
  });
}

@riverpod
ResetPasswordRemoteRequest resetPasswordRemoteRequest(
    ResetPasswordRemoteRequestRef ref) {
  return ResetPasswordRemoteRequestImpl();
}

class ResetPasswordRemoteRequestImpl implements ResetPasswordRemoteRequest {
  @override
  Future<AuthResponse> resetPassword({
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final String resetPasswordToken,
  }) async {
    late AuthResponse response;
    await NetworkRequest.instance.requestDataFuture<AuthResponse>(
      method: Method.post,
      url: Api.resetPassword,
      params: {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "passwordResetToken": resetPasswordToken,
      },
      onSuccess: (resetResponse) async {
        response = resetResponse;
      },
    );
    return response;
  }
}
