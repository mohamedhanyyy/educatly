import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/company/data/model/company_model.dart';
import 'package:taskaty/features/admin/company/data/datasources/get_company_remote_request.dart';

import '../../data/repository/get_compaines_repository_impl.dart';


part 'get_companies_repository.g.dart';

@riverpod
GetCompaniesRepository getCompaniesRepository(GetCompaniesRepositoryRef ref) {
  return GetCompaniesRepositoryImpl(
    getCompaniesRemoteRequest: ref.read(getCompanyRemoteRequestProvider),
  );
}

abstract class GetCompaniesRepository {
  Future<List<CompanyModel>> getCompanies();
}
