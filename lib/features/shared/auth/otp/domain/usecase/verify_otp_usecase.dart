import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/otp_response.dart';
import '../repository/otp_repository.dart';

part 'verify_otp_usecase.g.dart';

@riverpod
Future<OTPResponse> verifyOtpUseCase(
  VerifyOtpUseCaseRef ref, {
  required String otp,
  required String email,
}) {
  return ref.read(otpRepositoryProvider).verifyOtp(email: email, otp: otp);
}
