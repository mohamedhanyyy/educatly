import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../admin/tasks/data/model/admin_tasks_model.dart';
import '../../data/datasources/dashboard_remote_request.dart';
import '../../data/repository/dashboard_repository_impl.dart';

part 'dashboard_repository.g.dart';

@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepositoryImpl(
    dashboardRemoteRequest: ref.read(dashboardRemoteRequestProvider),
  );
}

abstract class DashboardRepository {
  Future<List<AdminTasksModel>> getTasks({
    int? filter,
    DateTime? date,
  });
}
