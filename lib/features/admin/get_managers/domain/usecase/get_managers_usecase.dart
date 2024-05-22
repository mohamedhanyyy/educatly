import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/get_managers/domain/repository/get_managers_repository.dart';

import '../../data/model/get_managers_model.dart';

part 'get_managers_usecase.g.dart';

@riverpod
Future<List<ManagerModel>> getManagersUseCase(GetManagersUseCaseRef ref) {
  return ref.read(getManagersRepositoryProvider).getManagers();
}
