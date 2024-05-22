import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/helpers/mappers.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../../../company/data/model/company_model.dart';
import '../model/add_task_response.dart';

part 'add_task_remote_request.g.dart';

abstract class AddTaskRemoteRequest {

  Future<AddTaskResponse> addTaskToUser({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String selectedPriority,
    required String selectedAssignee,
    required List<String?> subTasks,
    required List<File>? files,
  });

  Future<AddTaskResponse> editTask({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String selectedPriority,
    required CompanyModel company,
    required String selectedAssignee,
    required List<SubTasks?> subTasks,
    required List<File>? files,
  });
}

@riverpod
AddTaskRemoteRequest addTaskRemoteRequest(AddTaskRemoteRequestRef ref) {
  return AddTaskRemoteRequestImpl();
}

class AddTaskRemoteRequestImpl implements AddTaskRemoteRequest {
  @override
  Future<AddTaskResponse> addTaskToUser({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String selectedPriority,
    required String selectedAssignee,
    required List<String?> subTasks,
    required List<File>? files,
  }) async {
    // List<MultipartFile> fileList = [];
    // files?.map((e) async {
    //   fileList.add(await MultipartFile.fromFile(e.path));
    // }).toList();

    // final list =subTasks.map((e)   async {
    //   return {
    //     "description":e,
    //     "id":'${ await AppSettingsDatabase.instance.getAuthResponse()?.id}',
    //     "isDeleted": true,
    //     "isCompleted": true,
    //     "createdBy": "string",
    //   };
    // }).toList();

    late AddTaskResponse addTaskResponse;

    await NetworkRequest.instance.requestDataFuture<AddTaskResponse>(
      url: Api.addTask,
      method: Method.post,
      params: {
        "title": title,
        "description": description,
        "priorityId": mappingPriorityStrings(selectedPriority),
        "assignTo": selectedAssignee,
        "startDate": '$startDate'.replaceAll(' ', 'T'),
        "endDate": '$endDate'.replaceAll(' ', 'T'),
        "subTasks": subTasks
            .map((e) => {
                  "description": e,
                  "taskId": 0,
                  "isCompleted": true,
                  "createdBy": "string",
                })
            .toList(),
        "comments":
            subTasks.map((e) => {"description": 'e', "taskId": 0}).toList(),
      },
      onSuccess: (response) {
        addTaskResponse = response;
      },
    );
    return addTaskResponse;
  }


  @override
  Future<AddTaskResponse> editTask(
      {required String title,
      required String description,
      required DateTime startDate,
      required DateTime endDate,
      required String selectedPriority,
      required CompanyModel company,
      required String selectedAssignee,
      required List<SubTasks?> subTasks,
      required List<File>? files}) async {
    late AddTaskResponse editTaskResponse;

    await NetworkRequest.instance.requestDataFuture<AddTaskResponse>(
      url: Api.updateTask,
      method: Method.post,
      params: {
        "title": title,
        "description": description,
        "priorityId": mappingPriorityStrings(selectedPriority),
        "assignTo": "acb0dd80-c380-4919-b9f1-faa1364b0932",
        "startDate": '$startDate'.replaceAll(' ', 'T'),
        "endDate": '$endDate'.replaceAll(' ', 'T'),
        "subTasks": subTasks
            .map((e) => {
                  "description": e,
                  "taskId": 0,
                  "isCompleted": true,
                  "createdBy": "string",
                })
            .toList(),
        "comments":
            subTasks.map((e) => {"description": 'e', "taskId": 0}).toList(),
      },
      onSuccess: (response) {
        editTaskResponse = response;
      },
    );
    return editTaskResponse;
  }
}
