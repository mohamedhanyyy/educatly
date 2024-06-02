import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/base_response/base_response.dart';
import '../../../../../../core/services/network/network_utils.dart';

part 'create_password_remote_request.g.dart';

abstract class CreatePasswordRemoteRequest {
  Future<BaseResponse> createPassword({
    required final String email,
    required final String newPassword,
    required final String oldPassword,
    required final String newPasswordConfirm,
  });
}

@riverpod
CreatePasswordRemoteRequest createPasswordRemoteRequest(
    CreatePasswordRemoteRequestRef ref) {
  return CreatePasswordRemoteRequestImpl();
}

class CreatePasswordRemoteRequestImpl implements CreatePasswordRemoteRequest {
  @override
  Future<BaseResponse> createPassword({
    required final String email,
    required final String oldPassword,
    required final String newPassword,
    required final String newPasswordConfirm,
  }) async {
    late BaseResponse response;
    await NetworkRequest.instance.requestDataFuture<BaseResponse>(
      method: Method.post,
      url: Api.createPassword,
      params: {
        "email": email,
        "password": newPassword,
        "confirmPassword": newPasswordConfirm,
        "old_password": oldPassword,
//passwordResetToken
      },
      onSuccess: (forgetResponse) async {
        response = forgetResponse;
      },
    );
    return response;
  }
}
