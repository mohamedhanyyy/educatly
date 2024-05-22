import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../../data/datasources/otp_remote_request.dart';
import '../../data/model/otp_response.dart';
import '../../data/repository/otp_repository_impl.dart';

part 'otp_repository.g.dart';

@riverpod
OtpRepository otpRepository(OtpRepositoryRef ref) {
  return OtpRepositoryImpl(
    otpRemoteRequest: ref.read(otpRemoteRequestProvider),
  );
}

abstract class OtpRepository {
  Future<OTPResponse> verifyOtp({
    required final String otp,
    required final String email,
  });

  Future<BaseResponse> resendOtp({
    required final String email,
  });
}
