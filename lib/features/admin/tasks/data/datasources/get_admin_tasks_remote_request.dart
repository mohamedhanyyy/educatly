import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/constants.dart';

import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../../../get_managers/data/model/get_managers_model.dart';
import '../model/admin_tasks_model.dart';

part 'get_admin_tasks_remote_request.g.dart';

abstract class GetAdminTasksRemoteRequest {
  Future<List<AdminTasksModel>> getAdminTasks({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    String? searchText,
    ManagerModel? selectedManager,
    int? page,
  });
}

@riverpod
GetAdminTasksRemoteRequest getAdminTasksRemoteRequest(
    GetAdminTasksRemoteRequestRef ref) {
  return GetAdminTasksRemoteRequestImpl();
}

class GetAdminTasksRemoteRequestImpl implements GetAdminTasksRemoteRequest {
  @override
  Future<List<AdminTasksModel>> getAdminTasks({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    String? searchText,
    ManagerModel? selectedManager,
    int? page,
  }) async {
    late List<AdminTasksModel> tasks;
    await NetworkRequest.instance.requestDataFuture<AdminTasksModel>(
      url: Api.getAdminTasks,
      method: Method.get,
      queryParameters: {
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
      onSuccessList: (response) {
        tasks = response;
      },
    );

    return tasks;
  }
}
