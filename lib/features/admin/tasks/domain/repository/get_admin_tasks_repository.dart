import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/tasks/data/datasources/get_admin_tasks_remote_request.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';

import '../../../get_managers/data/model/get_managers_model.dart';
import '../../data/repository/get_admin_tasks_repository_impl.dart';

part 'get_admin_tasks_repository.g.dart';

@riverpod
GetAdminTasksRepository getAdminTasksRepository(
    GetAdminTasksRepositoryRef ref) {
  return GetAdminTasksRepositoryImpl(
    getAdminTasksRemoteRequest: ref.read(getAdminTasksRemoteRequestProvider),
  );
}

abstract class GetAdminTasksRepository {
  Future<List<AdminTasksModel>> getAdminTasks({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    String? searchText,
    int? page,
    ManagerModel? selectedManager,
  });
}
