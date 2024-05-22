import 'package:flutter/material.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';

import 'color_system_base.dart';

class ColorSystemLight extends ColorSystemBase {
  @override
  Color get primary => Color(0xFF3D7DF6);

  @override
  Color get appBar => Color(0xFFF2F4F7);

  @override
  Color get scaffold => Color(0xFFFFFFFF);

  @override
  Color get white => Color(0xffFFFAF3);

  @override
  Color get white2 => Color(0xffFAFBF9);

  @override
  Color get black => Color(0xff333333);

  @override
  Color get black2 => Color(0xffBFC5CD);

  @override
  Color get stroke => Color(0xff6795e8);

  @override
  Color get select => AppColors.colors.primary;

  @override
  Color get success => Color(0xff00af54);

  @override
  Color get warning => Color(0xffFFC106);

  @override
  Color get error => Color(0xffe3022c);

  @override
  Color get active => AppColors.colors.primary;

  @override
  Color get icons => Color(0xffEEEEEE);

  @override
  Color get lines => Color(0xffF3F3F3);

  @override
  Color get background => Color(0xff3D7DF6);

  Color get brown => Color(0xff5A5A5A);

  @override
  Color get darkBlue => Color(0xff006EE9);

  @override
  Color get lightGreen => Colors.green.withOpacity(0.1);

  @override
  Color get darkBlueLight => Color(0xff006EE9).withOpacity(0.1);

  @override
  Color get green => Colors.green;

  @override
  Color get lightPink => Colors.pink.withOpacity(0.1);

  @override
  Color get pink => Colors.pink;

  @override
  Color get chartBlue => Color(0xff14BBD8);

  @override
  Color get chartLightGreen => Color(0xff01DF85);

  @override
  Color get chartPink => Color(0xffF81FAC);

  @override
  Color get chartYellow => Color(0xffFA942F);
}
