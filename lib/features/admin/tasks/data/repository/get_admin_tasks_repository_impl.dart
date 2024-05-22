import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';

import '../../../get_managers/data/model/get_managers_model.dart';
import '../../domain/repository/get_admin_tasks_repository.dart';
import '../datasources/get_admin_tasks_remote_request.dart';

class GetAdminTasksRepositoryImpl implements GetAdminTasksRepository {
  final GetAdminTasksRemoteRequest getAdminTasksRemoteRequest;

  GetAdminTasksRepositoryImpl({required this.getAdminTasksRemoteRequest});

  Future<List<AdminTasksModel>> getAdminTasks(
      {DateTime? startDate,
      DateTime? endDate,
      int? selectedPriorityId,
      int? selectedStatusId,
      int? page,
      String? searchText,
      ManagerModel? selectedManager}) {
    return getAdminTasksRemoteRequest.getAdminTasks(
        selectedStatusId: selectedStatusId,
        searchText: searchText,
        endDate: endDate,
        startDate: startDate,
        page: page,
        selectedManager: selectedManager,
        selectedPriorityId: selectedPriorityId);
  }
}
