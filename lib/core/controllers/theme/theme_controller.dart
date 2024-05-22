import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../core/extensions/rebuild.dart';
import '../../../../../core/services/database/services/app_settings.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    state = AppSettingsDatabase.instance.getThemeMode;
    AppColors.i.themeMode = state;
    return state;
  }

  setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    (AppRouter.navigatorState.currentContext as Element).visitChildren(rebuild);
    AppColors.i.themeMode = themeMode;
    await PreferencesHelper.saveTheme(
        theme: themeMode.name == 'dark' ? 'dark' : 'light');
  }
}
