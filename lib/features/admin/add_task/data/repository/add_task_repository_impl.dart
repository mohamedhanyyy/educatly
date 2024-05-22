import 'dart:io';

import '../../../company/data/model/company_model.dart';
import '../../../get_managers/data/model/get_managers_model.dart';
import '../../domain/repository/add_task_repository.dart';
import '../datasources/add_task_remote_request.dart';
import '../model/add_task_response.dart';

class AddTaskRepositoryImpl implements AddTaskRepository {
  final AddTaskRemoteRequest addTaskRemoteRequest;

  AddTaskRepositoryImpl({required this.addTaskRemoteRequest});

  @override
  Future<AddTaskResponse> addTask(
      {required String title,
      required String description,
      required DateTime startDate,
      required DateTime endDate,
      required String? selectedPriority,
      required ManagerModel? selectedAssignee,
      required List<String> subTasks,
      List<File>? files}) {
    return addTaskRemoteRequest.addTaskToUser(
      title: title,
      description: description,
      startDate: startDate,
      endDate: endDate,
      selectedAssignee: selectedAssignee!.id!,
      selectedPriority: selectedPriority ?? '',
      subTasks: subTasks,
      files: files,
    );
  }

  // @override
  // Future<List<CountryData>> getManagers(int companyId) {
  //   return addTaskRemoteRequest.getManagers(companyId);
  // }

  @override
  Future<AddTaskResponse> editTask(
      {required String title,
      required String description,
      required DateTime startDate,
      required DateTime endDate,
      required String? selectedPriority,
      required CompanyModel companyName,
      required ManagerModel? selectedAssignee,
      required List<SubTasks> subTasks,
      List<File>? files}) {
    return addTaskRemoteRequest.editTask(
      title: title,
      description: description,
      startDate: startDate,
      endDate: endDate,
      company: companyName,
      selectedAssignee: selectedAssignee!.id!,
      selectedPriority: selectedPriority ?? '',
      subTasks: subTasks,
      files: files,
    );
  }
}
