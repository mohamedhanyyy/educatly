import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../admin/tasks/data/model/admin_tasks_model.dart';
import '../repository/dashboard_repository.dart';

part 'get_tasks_usecase.g.dart';

@riverpod
Future<List<AdminTasksModel>> getTasksUseCase(
  GetTasksUseCaseRef ref, {
  int? filter,
  DateTime? date,
}) {
  return ref.read(dashboardRepositoryProvider).getTasks(
        date: date,
        filter: filter,
      );
}
