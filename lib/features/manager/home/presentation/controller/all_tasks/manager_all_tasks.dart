import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/network_utils.dart';
import '../../../../../admin/tasks/data/model/admin_tasks_model.dart';

part 'manager_all_tasks.g.dart';

@riverpod
class ManagerAllTasksController extends _$ManagerAllTasksController {
  Future<List<AdminTasksModel>> build() async {
    return await getTasksList();
  }

  Future<List<AdminTasksModel>> getTasksList({
    int? filter,
    DateTime? date,
  }) async {
    state = AsyncValue.loading();
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
