import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/base_response/base_response.dart';
import '../../../../../../core/services/network/network_utils.dart';
part 'forget_password_remote_request.g.dart';

abstract class ForgetPasswordRemoteRequest {
  Future<BaseResponse> forgetPassword({required final String email});
}

@riverpod
ForgetPasswordRemoteRequest forgetPasswordRemoteRequest(
    ForgetPasswordRemoteRequestRef ref) {
  return ForgetPasswordRemoteRequestImpl();
}

class ForgetPasswordRemoteRequestImpl implements ForgetPasswordRemoteRequest {
  @override
  Future<BaseResponse> forgetPassword({
    required final String email,
  }) async {
    late BaseResponse response;
    await NetworkRequest.instance.requestDataFuture<BaseResponse>(
      method: Method.post,
      url: Api.forgetPassword,
      params: {"email": email},
      onSuccess: (forgetResponse) async {
        response = forgetResponse;
      },
    );
    return response;
  }
}
