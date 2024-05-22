import 'package:taskaty/features/admin/company/data/model/company_model.dart';
import 'package:taskaty/features/admin/company/data/datasources/get_company_remote_request.dart';

import '../../domain/repository/get_companies_repository.dart';

class GetCompaniesRepositoryImpl implements GetCompaniesRepository {
  final GetCompanyRemoteRequest getCompaniesRemoteRequest;

  GetCompaniesRepositoryImpl({required this.getCompaniesRemoteRequest});

  @override
  Future<List<CompanyModel>> getCompanies() {
    return getCompaniesRemoteRequest.getCompany();
  }
}
