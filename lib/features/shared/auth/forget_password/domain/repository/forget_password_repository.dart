import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/services/network/base_response/base_response.dart';
// import '../../../../../core/services/network/base_response/base_response.dart';
import '../../data/datasources/forget_password_remote_request.dart';
import '../../data/repository/forget_password_repository_impl.dart';

part 'forget_password_repository.g.dart';

@riverpod
ForgetPasswordRepository forgetPasswordRepository(
    ForgetPasswordRepositoryRef ref) {
  return ForgetPasswordRepositoryImpl(
    forgetPasswordRemoteRequest: ref.read(forgetPasswordRemoteRequestProvider),
  );
}

abstract class ForgetPasswordRepository {
  Future<BaseResponse> forgetPassword({required String email});
}
