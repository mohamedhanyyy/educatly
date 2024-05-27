part of 'edit_task_controller.dart';

@freezed
abstract class EditTaskState with _$EditTaskState {
  const EditTaskState._();

  const factory EditTaskState({
    String? taskTitle,
    String? taskDescription,
    DateTime? startDate,
    int? taskId,
    DateTime? endDate,
    int? selectedPriority,
    int? statusId,
    ManagerModel? selectedAssigne,
    int? selectedAssigneToIndex,
    List<String>? searchAssigneToList,
    bool? isEditTask,
    bool? isEditComment,
    bool? isSaveClick,
    List<SubTasks>? subTasks,
    List<Comments>? comments,
  }) = _EditTaskState;
}
