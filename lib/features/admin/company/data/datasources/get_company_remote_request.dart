import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/company/data/model/company_model.dart';

import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';

part 'get_company_remote_request.g.dart';

abstract class GetCompanyRemoteRequest {
  Future<List<CompanyModel>> getCompany();
}

@riverpod
GetCompanyRemoteRequest getCompanyRemoteRequest(
    GetCompanyRemoteRequestRef ref) {
  return GetCompanyRemoteRequestImpl();
}

class GetCompanyRemoteRequestImpl implements GetCompanyRemoteRequest {
  @override
  Future<List<CompanyModel>> getCompany() async {
    late List<CompanyModel> companies;
    await NetworkRequest.instance.requestDataFuture<CompanyModel>(
      url: Api.getCompany,
      method: Method.get,
      onError: (val, r) {},
      onSuccessList: (response) async {
        companies = response;
      },
    );
    return companies;
  }
}
