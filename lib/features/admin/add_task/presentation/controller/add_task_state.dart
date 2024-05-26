part of 'add_task_controller.dart';

@freezed
abstract class AddTaskState with _$AddTaskState {
  const AddTaskState._();

  const factory AddTaskState({
    String? taskTitle,
    String? taskDescription,
    required DateTime? startDate,
    required DateTime? endDate,
    int? priorityId,
    String? comment,
    ManagerModel? selectedManager,
    List<ManagerModel>? searchManagerList,
    List<File>? filePickerResult,
    bool? isAddTask,
    bool? isSaveClick,
    List<String>? tasks,
  }) = _AddTaskState;
}
