import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/features/admin/company/data/model/company_model.dart';

import '../../domain/usecase/get_companies_usecase.dart';

part 'get_companies_controller.g.dart';

@Riverpod(keepAlive: true)
class GetCompaniesController extends _$GetCompaniesController {
  @override
  Future<List<CompanyModel>> build() async {
    return await getCompanies();
  }

  Future<List<CompanyModel>> getCompanies() async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(
      () => ref.read(getCompaniesUseCaseProvider.future),
    );
    result.handleGuardResults(
      ref: ref,
      onError: () => throw result.error!,
      onSuccess: () {
        state = AsyncData(result.requireValue);
      },
    );
    return result.requireValue;
  }

  Future<List<CompanyModel>> searchCompany(text) async {
    List<CompanyModel>? myCompanies = [];
    state.requireValue.map((element) {
      if (element.nameEn!.contains(text)) {
        myCompanies.add(element);
      }
    }).toList();
    return myCompanies.isEmpty ? state.requireValue : myCompanies;
  }
}
