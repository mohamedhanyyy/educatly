import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/add_company_repository.dart';

part 'add_company_usecase.g.dart';

@riverpod
Future<void> addCompanyUseCase(
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
