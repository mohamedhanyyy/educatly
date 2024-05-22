import '../../domain/repository/privacy_repository.dart';
import '../datasources/privacy_remote_request.dart';
import '../model/privacy.dart';

class PrivacyRepositoryImpl implements PrivacyRepository {
  final PrivacyRemoteRequest privacyRemoteRequest;

  PrivacyRepositoryImpl({required this.privacyRemoteRequest});

  @override
  Future<List<Privacy>> getPrivacyPolicy() async {
    return privacyRemoteRequest.getPrivacyPolicy();
  }
}
