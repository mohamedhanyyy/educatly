import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/delete_user_repository.dart';

part 'delete_task_usecase.g.dart';

@riverpod
Future<void> deleteTaskUseCase(DeleteTaskUseCaseRef ref,
    {required int id}) async {
  return ref.read(deleteUserRepositoryProvider).deleteTask(id);
}
