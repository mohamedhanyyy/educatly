import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/add_user_response.dart';
import '../repository/add_user_repository.dart';

part 'admin_usecase.g.dart';

@riverpod
Future<AddUserResponse> adminUseCase(
  AdminUseCaseRef ref, {
  required String userName,
  required String fullName,
  required String email,
  required int role,
  required String password,
}) {
  return ref.read(addUserRepositoryProvider).addUserToApi(
        email: email,
        fullName: fullName,
        userName: userName,
        password: password,
        role: role,
      );
}
