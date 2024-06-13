import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/admin/task_details/task_details_state.dart';

import '../tasks/data/model/admin_tasks_model.dart';

class TaskDetailsBloc extends Cubit<TaskDetailsState> {
  TaskDetailsBloc() : super(TaskDetailsInitial());
  AdminTasksModel? taskDetails;
  Future<void> getTaskDetailsById(id) async {
    emit(TaskDetailsLoading());
    final response =
        await DioHelper.getData(url: 'Tasks/$id', query: {'id': id});

    if (response?.statusCode == 200) {
      taskDetails = AdminTasksModel.fromJson(response?.data['data']);

      emit(TaskDetailsDone(taskDetails!));
    } else {
      emit(TaskDetailsError());
    }
  }
}
