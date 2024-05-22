import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/edit_task/data/model/edit_task_response.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../../data/datasources/edit_task_remote_request.dart';
import '../../data/repository/edit_task_repository_impl.dart';

part 'edit_task_repository.g.dart';

@riverpod
EditTaskRepository editTaskRepository(EditTaskRepositoryRef ref) {
  return EditTaskRepositoryImpl(
      editTaskRemoteRequest: ref.read(editTaskRemoteRequestProvider));
}

abstract class EditTaskRepository {
  Future<EditTaskModel> editTask({
    required String title,
    required String description,
    required int taskId,
    required int statusId,
    required DateTime startDate,
    required DateTime endDate,
    required int? priorityId,
    required ManagerModel? selectedAssignee,
    required List<SubTasks> subTasks,
    List<File>? files,
  });
}
