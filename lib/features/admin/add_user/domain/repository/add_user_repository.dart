import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/add_user_remote_request.dart';
import '../../data/model/add_user_response.dart';
import '../../data/repository/add_user_repository_impl.dart';

part 'add_user_repository.g.dart';

@riverpod
AddUserRepository addUserRepository(AddUserRepositoryRef ref) {
  return AddUserRepositoryImpl(
      addUserRemoteRequest: ref.read(addUserRemoteRequestProvider));
}

abstract class AddUserRepository {
  Future<AddUserResponse> addUserToApi({
    required String userName,
    required String? fullName,
    required String email,
    required int role,
    required String password,
  });
}
