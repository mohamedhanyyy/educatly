import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasource/get_managers_remote_request.dart';
import '../../data/model/get_managers_model.dart';
import '../../data/repository/get_managers_repository_impl.dart';

part 'get_managers_repository.g.dart';

@riverpod
GetManagersRepository getManagersRepository(GetManagersRepositoryRef ref) {
  return GetManagersRepositoryImpl(
    getManagersRemoteRequest: ref.read(getManagersRemoteRequestProvider),
  );
}

abstract class GetManagersRepository {
  Future<List<ManagerModel>> getManagers();
}
