import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../../../../admin/tasks/data/model/admin_tasks_model.dart';

part 'dashboard_remote_request.g.dart';

abstract class DashboardRemoteRequest {
  Future<List<AdminTasksModel>> getTasks({
    int? filter,
    DateTime? date,
  });
}

@riverpod
DashboardRemoteRequest dashboardRemoteRequest(DashboardRemoteRequestRef ref) {
  return DashboardRemoteRequestImpl();
}

class DashboardRemoteRequestImpl implements DashboardRemoteRequest {
  @override
  Future<List<AdminTasksModel>> getTasks({
    int? filter,
    DateTime? date,
  }) async {
    late List<AdminTasksModel> tasksList;
    await NetworkRequest.instance.requestDataFuture<AdminTasksModel>(
      url: Api.tasks,
      method: Method.get,
      queryParameters: {
        'StatusId': filter,
        'FromDate': date,
      },
      onSuccessList: (getTasksResponse) async {
        tasksList = getTasksResponse;
      },
    );
    return tasksList;
  }
}
