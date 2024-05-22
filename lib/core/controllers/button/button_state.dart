part of 'button_controller.dart';

@freezed
abstract class ButtonState with _$ButtonState {
  const ButtonState._();

  const factory ButtonState({
    @Default(null) final Key? key,
    @Default(ButtonStatus.initial) final ButtonStatus status,
  }) = _ButtonState;
}
