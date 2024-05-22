import '../../domain/repository/add_user_repository.dart';
import '../datasources/add_user_remote_request.dart';
import '../model/add_user_response.dart';

class AddUserRepositoryImpl implements AddUserRepository {
  final AddUserRemoteRequest addUserRemoteRequest;

  AddUserRepositoryImpl({required this.addUserRemoteRequest});

  Future<AddUserResponse> addUserToApi({
    required String userName,
    required String? fullName,
    required String email,
    required int role,
    required String password,
  }) {
    return addUserRemoteRequest.addUser(
      userName: userName,
      fullName: fullName,
      role: role,
      email: email,
      password: password,
    );
  }

// @override
// Future<AddUserResponse> adminAddUserToApi(
//     {required String userName,
//     required String fullName,
//     required int companyId,
//     required String email,
//     required int role,
//     required String password}) {
//   return addUserRemoteRequest.addUserToApi(
//     email: email,
//     role: role,
//     password: password,
//     name: userName,
//   );
// }
}
