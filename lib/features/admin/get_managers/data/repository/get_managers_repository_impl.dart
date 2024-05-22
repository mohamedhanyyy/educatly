import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../domain/repository/get_managers_repository.dart';
import '../datasource/get_managers_remote_request.dart';

class GetManagersRepositoryImpl implements GetManagersRepository {
  final GetManagersRemoteRequest getManagersRemoteRequest;

  GetManagersRepositoryImpl({required this.getManagersRemoteRequest});

  @override
  Future<List<ManagerModel>> getManagers() {
    return getManagersRemoteRequest.getManagers();
  }
}
