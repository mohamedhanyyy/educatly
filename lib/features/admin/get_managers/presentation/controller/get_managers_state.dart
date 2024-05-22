part of 'get_managers_controller.dart';

@freezed
abstract class GetManagersState with _$GetManagersState {
  const GetManagersState._();

  const factory GetManagersState({
    String? taskTitle,
    String? taskDescription,
    required DateTime? startDate,
    required DateTime? endDate,
    int? priorityId,
    String? selectedAssigne,
    int? selectedAssigneToIndex,
    List<String>? searchAssigneToList,
    bool? isAddTask,
    bool? isSaveClick,
    List<String>? tasks,
  }) = _GetManagersState;
}
