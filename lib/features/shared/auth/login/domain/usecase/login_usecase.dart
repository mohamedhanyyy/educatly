import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/auth_response.dart';
import '../repository/login_repository.dart';

part 'login_usecase.g.dart';

@riverpod
Future<AuthResponse> loginUseCase(
  LoginUseCaseRef ref, {
  required String username,
  required String password,
}) {
  return ref
      .read(loginRepositoryProvider)
      .login(username: username, password: password);
}
