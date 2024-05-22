import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../repository/create_password_repository.dart';

part 'create_password_usecase.g.dart';

@riverpod
Future<BaseResponse> createPasswordUseCase(
  CreatePasswordUseCaseRef ref, {
  required String email,
  required String oldPassword,
  required String newPassword,
  required String newPasswordConfirm,
}) {
  return ref.read(createPasswordRepositoryProvider).createPassword(
      email: email,
      newPasswordConfirm: newPasswordConfirm,
      newPassword: newPassword,
      oldPassword: oldPassword);
}
