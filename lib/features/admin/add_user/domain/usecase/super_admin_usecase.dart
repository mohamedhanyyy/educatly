import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/add_user_response.dart';
import '../repository/add_user_repository.dart';

part 'super_admin_usecase.g.dart';

@riverpod
Future<AddUserResponse> superAdminUseCase(
  SuperAdminUseCaseRef ref, {
  required String userName,
  String? fullName,
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
