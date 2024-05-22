import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/api/network_api.dart';
import '../../../../../../core/services/network/network_utils.dart';
import '../model/auth_response.dart';

part 'login_remote_request.g.dart';

abstract class LoginRemoteRequest {
  Future<AuthResponse> login({
    required final String username,
    required final String password,
  });
}

@riverpod
LoginRemoteRequest loginRemoteRequest(LoginRemoteRequestRef ref) {
  return LoginRemoteRequestImpl();
}

class LoginRemoteRequestImpl implements LoginRemoteRequest {
  @override
  Future<AuthResponse> login({
    required final String username,
    required final String password,
  }) async {
    late AuthResponse authResponse;
    await NetworkRequest.instance.requestDataFuture<AuthResponse>(
      url: Api.login,
      method: Method.post,
      params: {
        "email": username,
        "password": password,
      },
      onSuccess: (loginResponse) async {
        authResponse = loginResponse;
      },
    );
    return await authResponse;
  }
}
