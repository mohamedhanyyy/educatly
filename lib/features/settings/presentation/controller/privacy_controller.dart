import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/extensions/async_value_extension.dart';
import '../../data/model/privacy.dart';
import '../../domain/usecase/get_privacy_usecase.dart';

part 'privacy_controller.g.dart';

@Riverpod(keepAlive: true)
class PrivacyController extends _$PrivacyController {
  @override
  Future<List<Privacy>> build() async {
    return await getPrivacyPolicy();
  }

  Future<List<Privacy>> getPrivacyPolicy() async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(
      () => ref.read(getPrivacyUseCaseProvider.future),
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
}
