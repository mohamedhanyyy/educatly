import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/base_response/base_response.dart';
import '../../../../../../core/services/network/network_utils.dart';
import '../model/otp_response.dart';

part 'otp_remote_request.g.dart';

abstract class OtpRemoteRequest {
  Future<OTPResponse> verifyOtp({
    required final String otp,
    required final String email,
  });

  Future<BaseResponse> resendOtp({
    required final String email,
  });
}

@riverpod
OtpRemoteRequest otpRemoteRequest(OtpRemoteRequestRef ref) {
  return OtpRemoteRequestImpl();
}

class OtpRemoteRequestImpl implements OtpRemoteRequest {
  @override
  Future<OTPResponse> verifyOtp({
    required final String otp,
    required final String email,
  }) async {
    late OTPResponse response;
    await NetworkRequest.instance.requestDataFuture<OTPResponse>(
      method: Method.post,
      url: Api.verifyOtp,
      params: {"otp": otp, "email": email},
      onSuccess: (otpResponse) => response = otpResponse,
    );
    return response;
  }

  @override
  Future<BaseResponse> resendOtp({required String email}) async {
    late BaseResponse response;
    await NetworkRequest.instance.requestDataFuture<BaseResponse>(
      method: Method.post,
      url: Api.resendOtp,
      params: {"email": email},
      onSuccess: (otpResponse) => response = otpResponse,
    );
    return response;
  }
}
