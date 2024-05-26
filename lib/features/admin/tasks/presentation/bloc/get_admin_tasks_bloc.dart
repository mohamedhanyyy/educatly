import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';
import 'package:taskaty/features/admin/tasks/presentation/bloc/get_admin_tasks_state.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../get_managers/data/model/get_managers_model.dart';

class AdminGetTasksBloc extends Cubit<GetAdminTasksState> {
  AdminGetTasksBloc() : super(GetAdminTasksStateInitial());
  List<AdminTasksModel> tasks = [];
  Future<List<dynamic>> getAdminTasks({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    String? searchText,
    ManagerModel? selectedManager,
    int? page,
  }) async {
    Response? response = await DioHelper.getData(
      url: Api.getAdminTasks,
      data: {
        if (startDate != null)
          "FromDate": DateFormat(AppConstants.isoFormat).format(startDate),
        if (endDate != null)
          "ToDate": DateFormat(AppConstants.isoFormat).format(endDate),
        'Title': searchText,
        'PriorityId': selectedPriorityId,
        'StatusId': selectedStatusId,
        'ManagerId': selectedManager?.id,
        'Page': page,
      },
    );

    if (response?.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response!.data);
      return jsonResponse.map((data) => MyObject.fromJson(data)).toList();
    }
  }
}
