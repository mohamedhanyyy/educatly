import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../core/extensions/rebuild.dart';

part 'localization_controller.g.dart';

@riverpod
class LocalizationController extends _$LocalizationController {
  @override
  Locale build() {
    state = Locale(PreferencesHelper.getLang);
    return state;
  }

  void setAppLocalization(String lang) async {
    if (state.languageCode != lang) {
      state = Locale(lang);
      (AppRouter.navigatorState.currentContext as Element)
          .visitChildren(rebuild);
      AppFonts.i.langCode = state.languageCode;
      PreferencesHelper.saveLang(lang: lang);
      AppRouter.router.pop();
    }
  }
}
