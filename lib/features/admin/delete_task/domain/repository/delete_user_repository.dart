import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasource/delete_user_remote_request.dart';
import '../../data/repository/delete_user_repository_impl.dart';

part 'delete_user_repository.g.dart';

@riverpod
DeleteUserRepository deleteUserRepository(DeleteUserRepositoryRef ref) {
  return DeleteUserRepositoryImpl(
    deleteUserRemoteRequest: ref.read(deleteUserRemoteRequestProvider),
  );
}

abstract class DeleteUserRepository {
  Future<void> deleteUser(id);
  Future<void> deleteTask(id);
}
