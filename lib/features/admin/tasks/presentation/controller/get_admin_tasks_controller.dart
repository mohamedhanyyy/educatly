import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';
import 'package:taskaty/features/admin/tasks/domain/usecase/get_admin_tasks_usecase.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/admin_tasks_filter_controller.dart';

import '../../../get_managers/data/model/get_managers_model.dart';

part 'get_admin_tasks_controller.g.dart';

@riverpod
class GetAdminTasksController extends _$GetAdminTasksController {
  @override
  Future<List<AdminTasksModel>> build() async {
    final watcher = ref.watch(adminTasksFilterControllerProvider);
    return await getAdminTasks(
      selectedPriorityId: watcher.selectedPriorityId,
      selectedStatusId: watcher.selectedStatusId,
      selectedManager: watcher.selectedManager,
      startDate: watcher.startDate,
      endDate: watcher.endDate,
      page: watcher.page,
      searchText: watcher.searchText,
    );
  }

  Future<List<AdminTasksModel>> getAdminTasks({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    int? page,
    String? searchText,
    ManagerModel? selectedManager,
  }) async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(
      () => ref.read(getAdminTasksUsecaseProvider(
        selectedPriorityId: selectedPriorityId,
        selectedManager: selectedManager,
        startDate: startDate,
        page: page,
        endDate: endDate,
        searchText: searchText,
        selectedStatusId: selectedStatusId,
      ).future),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () => throw result.error!,
      onSuccess: () {
        state = AsyncData(result.requireValue);
      },
    );
    return result.requireValue;
  }
}
