import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../repository/otp_repository.dart';

part 'resend_otp_usecase.g.dart';

@riverpod
Future<BaseResponse> resendOtpUseCase(
  ResendOtpUseCaseRef ref, {
  required String email,
}) {
  return ref.read(otpRepositoryProvider).resendOtp(email: email);
}
