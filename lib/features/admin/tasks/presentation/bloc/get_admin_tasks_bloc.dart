import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';
import 'package:taskaty/features/admin/tasks/presentation/bloc/get_admin_tasks_state.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../controller/admin_tasks_filter_controller.dart';

class AdminGetTasksBloc extends Cubit<GetAdminTasksState> {
  AdminGetTasksBloc() : super(GetAdminTasksStateInitial());
  List<AdminTasksModel> tasks = [];
  int page = 1;

  Future<void> getAdminTasks({
    required WidgetRef ref,
  }) async {
    // Move the access to adminTasksFilterControllerProvider inside the method
    final watcher = ref.watch(adminTasksFilterControllerProvider);

    // Now you can proceed with your method logic
    emit(GetAdminTasksStateLoading());
    Response? response = await DioHelper.getData(
      url: Api.getAdminTasks,
      data: {
        if (watcher.startDate != null)
          "FromDate":
              DateFormat(AppConstants.isoFormat).format(watcher.startDate!),
        if (watcher.endDate != null)
          "ToDate": DateFormat(AppConstants.isoFormat).format(watcher.endDate!),
        'Title': watcher.searchText,
        'PriorityId': watcher.selectedPriorityId,
        'StatusId': watcher.selectedStatusId,
        'ManagerId': watcher.selectedManager?.id,
        'Page': page,
      },
    );
    // print('zzzzzz');
    // print(response?.statusCode);
    // print(response?.data);
    if (response?.statusCode == 200) {
      final jsonResponse = json.decode(response?.data);
      final List<AdminTasksModel> data =
          jsonResponse.map((data) => AdminTasksModel.fromJson(data)).toList();
      data.forEach((e) {
        tasks.add(e);
      });
      page++;
      emit(GetAdminTasksStateDone());
    } else {
      emit(GetAdminTasksStateError());
    }
  }
}
