import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/network_utils.dart';

part 'delete_user_remote_request.g.dart';

abstract class DeleteUserRemoteRequest {
  Future<void> deleteUser(id);
  Future<void> deleteTask(id);
}

@riverpod
DeleteUserRemoteRequest deleteUserRemoteRequest(
    DeleteUserRemoteRequestRef ref) {
  return DeleteUserRemoteRequestImpl();
}

class DeleteUserRemoteRequestImpl implements DeleteUserRemoteRequest {
  @override
  Future<void> deleteUser(id) async {
    return await NetworkRequest.instance.requestDataFuture<int>(
        url: '${Api.deleteUser}',
        method: Method.delete,
        queryParameters: {'id': id});
  }

  @override
  Future<int> deleteTask(id) async {
    await NetworkRequest.instance.requestDataFuture<int>(
      url: '${Api.deleteTask}/$id',
      method: Method.post,
      // params: {'id': id},
    );
    // print('$data');
    return 1;
  }
}
