import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/delete_user_repository.dart';

part 'delete_user_usecase.g.dart';

@riverpod
Future<void> deleteUserUseCase(DeleteUserUseCaseRef ref,
    {required String id}) async {
  return ref.read(deleteUserRepositoryProvider).deleteUser(id);
}
