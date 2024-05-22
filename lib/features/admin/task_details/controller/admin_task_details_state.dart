part of 'admin_task_details_controller.dart';

@freezed
abstract class AdminTaskDetailsState with _$AdminTaskDetailsState {
  const AdminTaskDetailsState._();

  const factory AdminTaskDetailsState({
    String? taskTitle,
    String? taskDescription,
    DateTime? startDate,
    int? taskId,
    DateTime? endDate,
    String? selectedPriority,
    CompanyModel? selectedCompanyName,
    String? selectedAssigne,
    int? selectedAssigneToIndex,
    List<String>? searchAssigneToList,
    bool? isEditTask,
    bool? isSaveClick,
    List<SubTasks>? tasks,
  }) = _AdminTaskDetailsState;
}
