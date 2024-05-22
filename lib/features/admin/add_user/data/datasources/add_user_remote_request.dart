import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../model/add_user_response.dart';

part 'add_user_remote_request.g.dart';

abstract class AddUserRemoteRequest {
  Future<AddUserResponse> addUser({
    required String userName,
    required String? fullName,
    required String email,
    required int role,
    required String password,
  });
}

@riverpod
AddUserRemoteRequest addUserRemoteRequest(AddUserRemoteRequestRef ref) {
  return AddUserRemoteRequestImpl();
}

class AddUserRemoteRequestImpl implements AddUserRemoteRequest {
  Future<AddUserResponse> addUser({
    required String userName,
    required String? fullName,
    required String email,
    required int role,
    required String password,
  }) async {
    // late AddUserResponse addUserResponse;

    await NetworkRequest.instance.requestDataFuture<AddUserResponse>(
      url: Api.registerUser,
      method: Method.post,
      params: {
        "userName": userName,
        'fullName': fullName,
        'password': password,
        "email": email,
        "role": role,
        'companyId': 0,
      },
      onSuccess: (addUserResponse) async {
        Toast.showToast('Add user done');
      },
    );
    return AddUserResponse();
  }
}
