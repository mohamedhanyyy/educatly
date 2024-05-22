import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/privacy.dart';
import '../repository/privacy_repository.dart';

part 'get_privacy_usecase.g.dart';

@riverpod
Future<List<Privacy>> getPrivacyUseCase(GetPrivacyUseCaseRef ref) {
  return ref.read(privacyRepositoryProvider).getPrivacyPolicy();
}
