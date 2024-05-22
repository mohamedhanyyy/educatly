part of 'calender_controller.dart';

@freezed
abstract class CalenderState with _$CalenderState {
  const CalenderState._();

  const factory CalenderState({
    required DateTime currentMonth,
    required DateTime selectedDate,
  }) = _CalenderState;
}
