import 'dart:io';

import '../../../add_task/data/model/add_task_response.dart';
import '../../domain/repository/add_company_repository.dart';
import '../datasources/add_company_remote_request.dart';

class AddCompanyRepositoryImpl implements AddCompanyRepository {
  final AddCompanyRemoteRequest addCompanyRemoteRequest;

  AddCompanyRepositoryImpl({required this.addCompanyRemoteRequest});

  @override
  Future<void> addCompany(
      {required String arabicName,
      required String englishName,
      File? companyLogo,
      required String managerId,
      required String address}) {
    return addCompanyRemoteRequest.addCompany(
      arabicName: arabicName,
      englishName: englishName,
      managerId: managerId,
      address: address,
      companyLogo: companyLogo,
    );
  }

  @override
  Future<AddTaskResponse> editCompany(
      {required String arabicName,
      required String englishName,
      File? companyLogo,
      required String address}) {
    return addCompanyRemoteRequest.editCompany(
      arabicName: arabicName,
      englishName: englishName,
      address: address,
      companyLogo: companyLogo,
    );
  }
}
