import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../../domain/repository/create_password_repository.dart';
import '../datasources/create_password_remote_request.dart';

class CreatePasswordRepositoryImpl implements CreatePasswordRepository {
  final CreatePasswordRemoteRequest createPasswordRemoteRequest;

  CreatePasswordRepositoryImpl({required this.createPasswordRemoteRequest});

  Future<BaseResponse> createPassword({
    required final String email,
    required final String newPassword,
    required final String newPasswordConfirm,
    required final String oldPassword,
  }) async {
    return createPasswordRemoteRequest.createPassword(
        email: email,
        oldPassword: oldPassword,
        newPassword: newPassword,
        newPasswordConfirm: newPasswordConfirm);
  }
}
