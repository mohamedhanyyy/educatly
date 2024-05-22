import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/privacy_remote_request.dart';
import '../../data/model/privacy.dart';
import '../../data/repository/privacy_repository_impl.dart';

part 'privacy_repository.g.dart';

@riverpod
PrivacyRepository privacyRepository(PrivacyRepositoryRef ref) {
  return PrivacyRepositoryImpl(
    privacyRemoteRequest: ref.read(privacyRemoteRequestProvider),
  );
}

abstract class PrivacyRepository {
  Future<List<Privacy>> getPrivacyPolicy();
}
