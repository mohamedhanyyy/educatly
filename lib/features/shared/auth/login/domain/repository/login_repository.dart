import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/login_remote_request.dart';
import '../../data/model/auth_response.dart';
import '../../data/repository/login_repository_impl.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepositoryImpl(
      loginRemoteRequest: ref.read(loginRemoteRequestProvider));
}

abstract class LoginRepository {
  Future<AuthResponse> login({
    required String username,
    required String password,
  });
}
