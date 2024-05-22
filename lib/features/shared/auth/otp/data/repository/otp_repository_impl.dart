import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../../domain/repository/otp_repository.dart';
import '../datasources/otp_remote_request.dart';
import '../model/otp_response.dart';

class OtpRepositoryImpl implements OtpRepository {
  final OtpRemoteRequest otpRemoteRequest;

  OtpRepositoryImpl({required this.otpRemoteRequest});

  @override
  Future<OTPResponse> verifyOtp({
    required String otp,
    required String email,
  }) {
    return otpRemoteRequest.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<BaseResponse> resendOtp({required String email}) {
    return otpRemoteRequest.resendOtp(email: email);
  }
}
