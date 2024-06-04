import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/network_utils.dart';
import '../../../../../admin/tasks/data/model/admin_tasks_model.dart';

part 'manager_all_tasks.g.dart';

@Riverpod(keepAlive: true)
class ManagerAllTasksController extends _$ManagerAllTasksController {
  Future<List<AdminTasksModel>> build() async {
    return await getTasksList();
  }

  Future<List<AdminTasksModel>> getTasksList({
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
        'PageSize': 1000,
        'Page': 0,
      },
      onSuccessList: (getTasksResponse) {
        tasksList = getTasksResponse;
      },
    );
    return tasksList;
  }
}
