import 'package:flutter/cupertino.dart';

extension CurrentLang on BuildContext {
  bool get isCurrentEnglish =>
      Localizations.localeOf(this) == const Locale('en');

  bool get isCurrentArabic =>
      Localizations.localeOf(this) == const Locale('ar');
}

extension ToColorFilter on Color {
  ColorFilter? get toColorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
