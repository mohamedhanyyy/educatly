part of 'settings_controller.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({AuthResponse? user, int? x}) = _SettingsState;
}
