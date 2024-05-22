import '../../../../admin/tasks/data/model/admin_tasks_model.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../datasources/dashboard_remote_request.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteRequest dashboardRemoteRequest;

  DashboardRepositoryImpl({required this.dashboardRemoteRequest});

  @override
  Future<List<AdminTasksModel>> getTasks({
    int? filter,
    DateTime? date,
  }) async {
    return dashboardRemoteRequest.getTasks(
      date: date,
      filter: filter,
    );
  }
}
