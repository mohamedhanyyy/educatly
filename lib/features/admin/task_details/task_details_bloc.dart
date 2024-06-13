import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';

import '../tasks/data/model/admin_tasks_model.dart';

class TaskDetailsBloc extends Cubit<CubitState> {
  TaskDetailsBloc() : super(CubitState.initial);
  AdminTasksModel? taskDetails;
  Future<void> getTaskDetailsById(id) async {
    emit(CubitState.loading);
    final response = await DioHelper.getData(url: 'Tasks', data: {'id': id});
    print(id);
    if (response?.statusCode == 200) {
      taskDetails = AdminTasksModel.fromJson(response?.data);
      print(taskDetails?.startDate);
      print(taskDetails?.endDate);
      print(taskDetails?.description);
      print(taskDetails?.subTasks?.length);
      emit(CubitState.done);
    } else {
      emit(CubitState.error);
    }
  }
}
