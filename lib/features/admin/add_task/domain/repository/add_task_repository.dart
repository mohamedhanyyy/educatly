import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../company/data/model/company_model.dart';
import '../../../get_managers/data/model/get_managers_model.dart';
import '../../data/datasources/add_task_remote_request.dart';
import '../../data/model/add_task_response.dart';
import '../../data/repository/add_task_repository_impl.dart';

part 'add_task_repository.g.dart';

@riverpod
AddTaskRepository addTaskRepository(AddTaskRepositoryRef ref) {
  return AddTaskRepositoryImpl(
      addTaskRemoteRequest: ref.read(addTaskRemoteRequestProvider));
}

abstract class AddTaskRepository {
  Future<AddTaskResponse> addTask({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String? selectedPriority,
    required ManagerModel? selectedAssignee,
    required List<String> subTasks,
    List<File>? files,
  });

  Future<AddTaskResponse> editTask({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String? selectedPriority,
    required CompanyModel companyName,
    required ManagerModel? selectedAssignee,
    required List<SubTasks> subTasks,
    List<File>? files,
  });
}
