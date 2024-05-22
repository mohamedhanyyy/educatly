import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_button.dart';

part 'button_controller.freezed.dart';
part 'button_controller.g.dart';
part 'button_state.dart';

@riverpod
class ButtonController extends _$ButtonController {
  @override
  ButtonState build() {
    return ButtonState();
  }

  setLoadingStatus(Key key) => state = state.copyWith(
        key: key,
        status: ButtonStatus.loading,
      );

  setDisabledStatus(Key key) => state = state.copyWith(
        key: key,
        status: ButtonStatus.disabled,
      );

  setSuccessStatus(Key key) async {
    state = state = state.copyWith(
      key: key,
      status: ButtonStatus.success,
    );
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () => state = state = state.copyWith(
        key: key,
        status: ButtonStatus.initial,
      ),
    );
  }

  setErrorStatus(Key key) async {
    state = state = state.copyWith(
      key: key,
      status: ButtonStatus.error,
    );
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () => state = state = state.copyWith(
        key: key,
        status: ButtonStatus.initial,
      ),
    );
  }
}
