import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filters_controller.g.dart';

@riverpod
class FiltersController extends _$FiltersController {
  @override
  int build() => 1;

  void selectFilter(int id) => state = id;
}
