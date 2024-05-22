import 'package:flutter/material.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

class AppSettingsDatabase {
  static AppSettingsDatabase? _instance;

  // Avoid self instance
  AppSettingsDatabase._();

  static AppSettingsDatabase get instance {
    _instance ??= AppSettingsDatabase._();
    return _instance!;
  }

  setThemeMode(String theme) {
    PreferencesHelper.saveTheme(theme: theme);
  }

  ThemeMode get getThemeMode {
    switch (PreferencesHelper.getTheme) {
      case "dark":
        return ThemeMode.dark;

      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
