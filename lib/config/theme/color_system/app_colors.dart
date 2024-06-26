import 'package:flutter/material.dart';

import 'color_system_base.dart';
import 'color_system_dark.dart';
import 'color_system_light.dart';

class AppColors {
  static AppColors? _instance;

  // Avoid self instance
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  static ColorSystemBase get colors {
    return i._colors;
  }

  late ThemeMode _themeMode;

  set themeMode(ThemeMode mode) => _themeMode = mode;

  ColorSystemBase get _colors {
    switch (_themeMode) {
      case ThemeMode.dark:
        return ColorSystemDark();
      default:
        return ColorSystemLight();
    }
  }
}

MaterialColor getMaterialColor(Color color) {
  final primary = const Color(0xFF3D7DF6);

  final Map<int, Color> shades = {
    50: primary,
    100: primary,
    200: primary,
    300: primary,
    400: primary,
    500: primary,
    600: primary,
    700: primary,
    800: primary,
    900: primary
  };

  return MaterialColor((0xFF3D7DF6), shades);
}
