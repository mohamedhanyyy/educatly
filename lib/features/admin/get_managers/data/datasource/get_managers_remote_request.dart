import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/network_utils.dart';

part 'get_managers_remote_request.g.dart';

abstract class GetManagersRemoteRequest {
  Future<List<ManagerModel>> getManagers();
}

@riverpod
GetManagersRemoteRequest getManagersRemoteRequest(
    GetManagersRemoteRequestRef ref) {
  return GetManagersRemoteRequestImpl();
}

class GetManagersRemoteRequestImpl implements GetManagersRemoteRequest {
  int managerId = 3;
  @override
  Future<List<ManagerModel>> getManagers() async {
    late List<ManagerModel> managers;
    await NetworkRequest.instance.requestDataFuture<ManagerModel>(
      url: Api.getManagers,
      queryParameters: {'role': managerId},
      method: Method.get,
      onSuccessList: (response) async {
        managers = response;
      },
    );
    return managers;
  }
}
