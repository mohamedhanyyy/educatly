import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../admin/tasks/data/model/admin_tasks_model.dart';
import '../../domain/usecase/get_tasks_usecase.dart';
import 'calender_controller.dart';
import 'filters_controller.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  Future<List<AdminTasksModel>> build() async {
    return await getTasksList(
      filter: ref.read(filtersControllerProvider),
      date: ref.read(calenderControllerProvider).selectedDate,
    );
  }

  Future<List<AdminTasksModel>> getTasksList({
    int? filter,
    DateTime? date,
  }) async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(
      () => ref.read(
        getTasksUseCaseProvider(date: date, filter: filter).future,
      ),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () => throw result.error!,
      onSuccess: () async {
        state = AsyncData(result.requireValue);
      },
    );
    return result.requireValue;
  }
}
