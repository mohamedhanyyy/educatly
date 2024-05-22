import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../../../get_managers/data/model/get_managers_model.dart';
import '../model/edit_task_response.dart';

part 'edit_task_remote_request.g.dart';

abstract class EditTaskRemoteRequest {
  Future<EditTaskModel> editTask({
    required String title,
    required String description,
    required int taskId,
    required int statusId,
    required DateTime startDate,
    required DateTime endDate,
    required int selectedPriority,
    required ManagerModel selectedAssignee,
    required List<SubTasks?> subTasks,
    required List<File>? files,
  });
}

@riverpod
EditTaskRemoteRequest editTaskRemoteRequest(EditTaskRemoteRequestRef ref) {
  return EditTaskRemoteRequestImpl();
}

class EditTaskRemoteRequestImpl implements EditTaskRemoteRequest {
  @override
  Future<EditTaskModel> editTask(
      {required String title,
      required String description,
      required int taskId,
      required int statusId,
      required DateTime startDate,
      required DateTime endDate,
      required int selectedPriority,
      required ManagerModel selectedAssignee,
      required List<SubTasks?> subTasks,
      required List<File>? files}) async {
    late EditTaskModel editTaskResponse;

    await NetworkRequest.instance.requestDataFuture<EditTaskModel>(
      url: Api.updateTask,
      method: Method.post,
      params: {
        "title": title,
        "id": taskId,
        "description": description,
        "statusId": statusId,
        "priorityId": selectedPriority,
        // "priorityId": mappingPriority(selectedPriority),
        "assignTo": "${selectedAssignee.id}",
        "startDate": '$startDate'.replaceAll(' ', 'T'),
        "endDate": '$endDate'.replaceAll(' ', 'T'),
        "subTasks":
            subTasks.map((e) => {"description": '${e?.description}'}).toList(),
      },
      onSuccess: (response) {
        editTaskResponse = response;
      },
    );
    return editTaskResponse;
  }
}
