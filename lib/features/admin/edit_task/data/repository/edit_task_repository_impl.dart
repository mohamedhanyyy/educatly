import 'dart:io';

import 'package:taskaty/features/admin/edit_task/data/datasources/edit_task_remote_request.dart';
import 'package:taskaty/features/admin/edit_task/domain/repository/edit_task_repository.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../../add_task/data/model/add_task_response.dart';
import '../model/edit_task_response.dart';

class EditTaskRepositoryImpl implements EditTaskRepository {
  final EditTaskRemoteRequest editTaskRemoteRequest;

  EditTaskRepositoryImpl({required this.editTaskRemoteRequest});

  @override
  Future<EditTaskModel> editTask({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required int taskId,
    required int? priorityId,
    required int statusId,
    required ManagerModel? selectedAssignee,
    required List<SubTasks> subTasks,
    List<File>? files,
  }) {
    return editTaskRemoteRequest.editTask(
      title: title,
      description: description,
      startDate: startDate,
      statusId: statusId,
      endDate: endDate,
      taskId: taskId,
      selectedAssignee: selectedAssignee!,
      selectedPriority: priorityId!,
      subTasks: subTasks,
      files: files,
    );
  }
}
