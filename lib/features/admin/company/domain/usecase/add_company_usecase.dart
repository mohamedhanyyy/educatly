import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../../../add_task/data/model/edit_task_response.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../repository/add_company_repository.dart';

part 'add_company_usecase.g.dart';

@riverpod
Future<AddTaskResponse> addCompanyUseCase(
  AddCompanyUseCaseRef ref, {
  required String arabicName,
  required String englishName,
  required String address,
  required String managerId,
  required File? logo,
}) {
  return ref.read(addCompanyRepositoryProvider).addCompany(
        arabicName: arabicName,
        englishName: englishName,
        companyLogo: logo,
        managerId: managerId,
        address: address,
      );
}
