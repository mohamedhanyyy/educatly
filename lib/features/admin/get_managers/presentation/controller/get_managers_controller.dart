import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import '../../data/model/get_managers_model.dart';
import '../../domain/usecase/get_managers_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_managers_controller.freezed.dart';
part 'get_managers_controller.g.dart';
part 'get_managers_state.dart';

@Riverpod(keepAlive: true)
class GetManagersController extends _$GetManagersController {
  @override
  Future<List<ManagerModel>> build() async {
    return await getManagers();
  }

  Future<List<ManagerModel>> getManagers() async {
    state = AsyncValue.loading();
    final result = await AsyncValue.guard(
      () => ref.read(getManagersUseCaseProvider.future),
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

  Future<List<ManagerModel>> searchManager(text) async {
    List<ManagerModel>? managers = [];
    state.requireValue.map((element) {
      if (element.userName!.contains(text)) {
        managers.add(element);
      }
    }).toList();
    return managers.isEmpty ? state.requireValue : managers;
  }
}
