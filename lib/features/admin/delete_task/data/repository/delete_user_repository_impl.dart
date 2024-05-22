import '../../domain/repository/delete_user_repository.dart';
import '../datasource/delete_user_remote_request.dart';

class DeleteUserRepositoryImpl implements DeleteUserRepository {
  final DeleteUserRemoteRequest deleteUserRemoteRequest;

  DeleteUserRepositoryImpl({required this.deleteUserRemoteRequest});

  @override
  Future<void> deleteUser(id) {
    return deleteUserRemoteRequest.deleteUser(id);
  }

  @override
  Future<void> deleteTask(id) {
    return deleteUserRemoteRequest.deleteTask(id);
  }
}
