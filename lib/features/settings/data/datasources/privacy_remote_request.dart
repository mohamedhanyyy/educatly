import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/services/network/api/network_api.dart';
import '../../../../core/services/network/network_utils.dart';
import '../model/privacy.dart';

part 'privacy_remote_request.g.dart';

abstract class PrivacyRemoteRequest {
  Future<List<Privacy>> getPrivacyPolicy();
}

@riverpod
PrivacyRemoteRequest privacyRemoteRequest(PrivacyRemoteRequestRef ref) {
  return PrivacyRemoteRequestImpl();
}

class PrivacyRemoteRequestImpl implements PrivacyRemoteRequest {
  @override
  Future<List<Privacy>> getPrivacyPolicy() async {
    late List<Privacy> privacyResponse;
    await NetworkRequest.instance.requestDataFuture<Privacy>(
      method: Method.get,
      url: Api.privacyPolicy,
      onError: (code, msg) => Toast.showToast(msg),
      onSuccessList: (getPrivacyResponse) async {
        privacyResponse = getPrivacyResponse;
      },
    );
    return privacyResponse;
  }
}
