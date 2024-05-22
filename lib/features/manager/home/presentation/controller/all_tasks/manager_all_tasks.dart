import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';

import '../../../../../admin/tasks/data/model/admin_tasks_model.dart';
import '../../../domain/usecase/get_tasks_usecase.dart';

part 'manager_all_tasks.g.dart';

@riverpod
class ManagerAllTasksController extends _$ManagerAllTasksController {
  Future<List<AdminTasksModel>> build() async {
    return await getTasksList();
  }

  Future<List<AdminTasksModel>> getTasksList({
    int? filter,
    DateTime? date,
  }) async {
    state = AsyncValue.loading();
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
