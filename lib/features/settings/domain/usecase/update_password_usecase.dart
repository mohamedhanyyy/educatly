import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/network/base_response/base_response.dart';
import '../repository/settings_repository.dart';

part 'update_password_usecase.g.dart';

@riverpod
Future<BaseResponse> updatePasswordUseCase(
  UpdatePasswordUseCaseRef ref, {
  required String userName,
  required String newPass,
  required String currentPass,
}) {
  return ref.read(settingsRepositoryProvider).updatePassword(
        name: userName,
        newPass: newPass,
        currentPass: currentPass,
      );
}
