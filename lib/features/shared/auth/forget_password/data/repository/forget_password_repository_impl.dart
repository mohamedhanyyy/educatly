import '../../../../../../core/services/network/base_response/base_response.dart';
import '../../domain/repository/forget_password_repository.dart';
import '../datasources/forget_password_remote_request.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteRequest forgetPasswordRemoteRequest;

  ForgetPasswordRepositoryImpl({required this.forgetPasswordRemoteRequest});

  @override
  Future<BaseResponse> forgetPassword({required String email}) async {
    return forgetPasswordRemoteRequest.forgetPassword(email: email);
  }
}
