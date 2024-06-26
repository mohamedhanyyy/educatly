import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../add_task/data/model/add_task_response.dart';
import '../../company/data/model/company_model.dart';

part 'admin_task_details_controller.freezed.dart';
part 'admin_task_details_controller.g.dart';
part 'admin_task_details_state.dart';

@riverpod
class AdminTaskDetailsController extends _$AdminTaskDetailsController {
  @override
  AdminTaskDetailsState build() {
    return const AdminTaskDetailsState();
  }

  void setData({List<SubTasks>? subTasks}) {
    state = state.copyWith(tasks: subTasks ?? state.tasks);
  }
}
