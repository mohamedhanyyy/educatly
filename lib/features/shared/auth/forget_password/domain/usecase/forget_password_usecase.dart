import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../repository/forget_password_repository.dart';

part 'forget_password_usecase.g.dart';

@riverpod
Future<BaseResponse> forgetPasswordUseCase(
  ForgetPasswordUseCaseRef ref, {
  required String email,
}) {
  return ref
      .read(forgetPasswordRepositoryProvider)
      .forgetPassword(email: email);
}
