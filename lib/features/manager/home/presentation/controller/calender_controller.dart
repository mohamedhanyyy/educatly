import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dashboard_controller.dart';

part 'calender_controller.freezed.dart';
part 'calender_controller.g.dart';
part 'calender_state.dart';

@riverpod
class CalenderController extends _$CalenderController {
  @override
  CalenderState build() {
    return CalenderState(
      currentMonth: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      selectedDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
  }

  void nextMonth(FixedExtentScrollController controller) {
    state = state.copyWith(
      currentMonth: DateTime(
        state.currentMonth.month != 12
            ? state.currentMonth.year
            : state.currentMonth.year + 1,
        state.currentMonth.month != 12 ? state.currentMonth.month + 1 : 1,
        1,
      ),
    );
    controller.animateToItem(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      state.currentMonth.month == state.selectedDate.month
          ? state.selectedDate.day - 1
          : 0,
    );
  }

  void previousMonth(FixedExtentScrollController controller) {
    state = state.copyWith(
      currentMonth: DateTime(
        state.currentMonth.month != 1
            ? state.currentMonth.year
            : state.currentMonth.year - 1,
        state.currentMonth.month != 1 ? state.currentMonth.month - 1 : 12,
        1,
      ),
    );
    controller.animateToItem(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      state.currentMonth.month == state.selectedDate.month
          ? state.selectedDate.day - 1
          : 0,
    );
  }

  void selectFullDate(
    DateTime date,
    FixedExtentScrollController controller,
  ) async {
    state = state.copyWith(currentMonth: date, selectedDate: date);
    // ignore: unused_result
    await ref.refresh(dashboardControllerProvider.notifier);
    controller.animateToItem(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      state.currentMonth.month == state.selectedDate.month
          ? state.selectedDate.day - 1
          : 0,
    );
  }

  void animateToSelectedDate(FixedExtentScrollController controller) {
    controller.animateToItem(
      curve: Curves.linear,
      state.selectedDate.day - 1,
      duration: const Duration(milliseconds: 300),
    );
  }
}
