import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/base_response/base_response.dart';
import '../../data/datasources/create_password_remote_request.dart';
import '../../data/repository/create_password_repository_impl.dart';

part 'create_password_repository.g.dart';

@riverpod
CreatePasswordRepository createPasswordRepository(
    CreatePasswordRepositoryRef ref) {
  return CreatePasswordRepositoryImpl(
    createPasswordRemoteRequest: ref.read(createPasswordRemoteRequestProvider),
  );
}

abstract class CreatePasswordRepository {
  Future<BaseResponse> createPassword(
      {required String email,
      required String newPassword,
      required String newPasswordConfirm,
      required String oldPassword});
}
