part of 'admin_tasks_filter_controller.dart';

@freezed
abstract class AdminTasksFilterState with _$AdminTasksFilterState {
  const AdminTasksFilterState._();

  const factory AdminTasksFilterState({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    int? page,
    String? searchText,
    ManagerModel? selectedManager,
    List<ManagerModel>? managers,
  }) = _AdminTasksFilterState;
}
