import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';

import '../../../get_managers/data/model/get_managers_model.dart';
import '../repository/get_admin_tasks_repository.dart';

part 'get_admin_tasks_usecase.g.dart';

@riverpod
Future<List<AdminTasksModel>> getAdminTasksUsecase(
  GetAdminTasksUsecaseRef ref, {
  DateTime? startDate,
  DateTime? endDate,
  int? selectedPriorityId,
  int? selectedStatusId,
  int? page,
  String? searchText,
  ManagerModel? selectedManager,
}) {
  return ref.read(getAdminTasksRepositoryProvider).getAdminTasks(
        selectedStatusId: selectedStatusId,
        searchText: searchText,
        endDate: endDate,
        page: page,
        startDate: startDate,
        selectedManager: selectedManager,
        selectedPriorityId: selectedPriorityId,
      );
}
