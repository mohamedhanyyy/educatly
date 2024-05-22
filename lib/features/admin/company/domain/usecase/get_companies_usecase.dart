import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/company/data/model/company_model.dart';

import '../repository/get_companies_repository.dart';

part 'get_companies_usecase.g.dart';

@riverpod
Future<List<CompanyModel>> getCompaniesUseCase(GetCompaniesUseCaseRef ref) {
  return ref.read(getCompaniesRepositoryProvider).getCompanies();
}
