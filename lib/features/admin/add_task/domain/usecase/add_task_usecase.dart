import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../get_managers/data/model/get_managers_model.dart';
import '../../data/model/add_task_response.dart';
import '../repository/add_task_repository.dart';

part 'add_task_usecase.g.dart';

@riverpod
Future<AddTaskResponse> addTaskUseCase(
  AddTaskUseCaseRef ref, {
  required String title,
  required String description,
  required DateTime startDate,
  required DateTime endDate,
  required String? selectedPriority,
  required ManagerModel? selectedAssignee,
  required List<String> subTasks,
  List<File>? files,
}) {
  return ref.read(addTaskRepositoryProvider).addTask(
        title: title,
        description: description,
        startDate: startDate,
        endDate: endDate,
        subTasks: subTasks,
        files: files,
        selectedPriority: selectedPriority,
        selectedAssignee: selectedAssignee,
      );
}
