import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'avatar_controller.g.dart';

@riverpod
class AvatarController extends _$AvatarController {
  @override
  File? build() => null;

  updateAvatar(File? avatar) {
    state = avatar;
  }
}
