import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../../data/model/edit_task_response.dart';
import '../repository/edit_task_repository.dart';

part 'edit_task_usecase.g.dart';

@riverpod
Future<EditTaskModel> editTaskUseCase(
  EditTaskUseCaseRef ref, {
  required String title,
  required String description,
  required DateTime startDate,
  required int taskId,
  required int statusId,
  required DateTime endDate,
  required int selectedPriority,
  required ManagerModel? selectedAssignee,
  required List<SubTasks> subTasks,
  List<File>? files,
}) {
  return ref.read(editTaskRepositoryProvider).editTask(
        title: title,
        description: description,
        startDate: startDate,
        endDate: endDate,
        statusId: statusId,
        subTasks: subTasks,
        taskId: taskId,
        files: files,
        priorityId: selectedPriority,
        selectedAssignee: selectedAssignee,
      );
}
