import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../add_task/data/model/add_task_response.dart';
import '../../data/datasources/add_company_remote_request.dart';
import '../../data/repository/add_company_repository_impl.dart';

part 'add_company_repository.g.dart';

@riverpod
AddCompanyRepository addCompanyRepository(AddCompanyRepositoryRef ref) {
  return AddCompanyRepositoryImpl(
      addCompanyRemoteRequest: ref.read(addCompanyRemoteRequestProvider));
}

abstract class AddCompanyRepository {
  Future<AddTaskResponse> addCompany({
    required String arabicName,
    required String englishName,
    required String managerId,
    required String address,
    required File? companyLogo,
  });

  Future<AddTaskResponse> editCompany({
    required String arabicName,
    required String englishName,
    required String address,
    required File? companyLogo,
  });
}
