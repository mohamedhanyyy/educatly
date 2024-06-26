import 'package:flutter/material.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';

import 'color_system_base.dart';

class ColorSystemLight extends ColorSystemBase {
  @override
  Color get primary => const Color(0xFF3D7DF6);

  @override
  Color get appBar => const Color(0xFFF2F4F7);

  @override
  Color get scaffold => const Color(0xFFFFFFFF);

  @override
  Color get white => const Color(0xffFFFAF3);

  @override
  Color get white2 => const Color(0xffFAFBF9);

  @override
  Color get black => const Color(0xff333333);

  @override
  Color get black2 => const Color(0xffBFC5CD);

  @override
  Color get stroke => const Color(0xff6795e8);

  @override
  Color get select => AppColors.colors.primary;

  @override
  Color get success => const Color(0xff00af54);

  @override
  Color get warning => const Color(0xffFFC106);

  @override
  Color get error => const Color(0xffe3022c);

  @override
  Color get active => AppColors.colors.primary;

  @override
  Color get icons => const Color(0xffEEEEEE);

  @override
  Color get lines => const Color(0xffF3F3F3);

  @override
  Color get background => const Color(0xff3D7DF6);

  Color get brown => const Color(0xff5A5A5A);

  @override
  Color get darkBlue => const Color(0xff006EE9);

  @override
  Color get lightGreen => Colors.green.withOpacity(0.1);

  @override
  Color get darkBlueLight => const Color(0xff006EE9).withOpacity(0.1);

  @override
  Color get green => Colors.green;

  @override
  Color get lightPink => Colors.pink.withOpacity(0.1);

  @override
  Color get pink => Colors.pink;

  @override
  Color get chartBlue => const Color(0xff14BBD8);

  @override
  Color get chartLightGreen => const Color(0xff01DF85);

  @override
  Color get chartPink => const Color(0xffF81FAC);

  @override
  Color get chartYellow => const Color(0xffFA942F);
}
