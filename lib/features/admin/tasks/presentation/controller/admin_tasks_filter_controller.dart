import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/constants.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../get_managers/data/model/get_managers_model.dart';

part 'admin_tasks_filter_controller.freezed.dart';
part 'admin_tasks_filter_controller.g.dart';
part 'admin_tasks_filter_state.dart';

@riverpod
class AdminTasksFilterController extends _$AdminTasksFilterController {
  AdminTasksFilterState build() {
    return const AdminTasksFilterState();
  }

  void searchManager(
      {required String text, required List<ManagerModel> managers}) {
    List<ManagerModel> newList = [];
    for (int i = 0; i < managers.length; i++) {
      if (managers.elementAt(i).userName?.contains(text) == true) {
        newList.add(managers.elementAt(i));
      }
    }
    state = state.copyWith(managers: managers.isEmpty ? [] : newList);
  }

  getFormattedStartDate() => state.startDate == null
      ? S().start_date
      : '${DateFormat(AppConstants.normalFormat).format(state.startDate!)}';

  getFormattedEndDate() => state.endDate == null
      ? S().end_date
      : '${DateFormat(AppConstants.normalFormat).format(state.endDate!)}';

  void clearList() {
    state = state.copyWith(managers: []);
  }

  void setData({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    String? searchText,
    ManagerModel? selectedManager,
    List<ManagerModel>? managers,
    int? page,
  }) {
    state = state.copyWith(
      managers: state.managers ?? managers,
      page: page,
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
      selectedPriorityId: selectedPriorityId ?? state.selectedPriorityId,
      selectedStatusId: selectedStatusId ?? state.selectedStatusId,
      searchText: searchText ?? state.searchText,
      selectedManager: selectedManager ?? state.selectedManager,
    );
  }
}
