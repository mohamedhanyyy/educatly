import '../../domain/repository/login_repository.dart';
import '../datasources/login_remote_request.dart';
import '../model/auth_response.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteRequest loginRemoteRequest;

  LoginRepositoryImpl({required this.loginRemoteRequest});

  @override
  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    return loginRemoteRequest.login(
      username: username,
      password: password,
    );
  }
}
