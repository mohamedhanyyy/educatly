import 'package:flutter/material.dart';

import 'color_system_base.dart';

class ColorSystemDark extends ColorSystemBase {
  @override
  Color get primary => const Color(0xFF3D7DF6);

  @override
  Color get appBar => const Color(0xff272626);

  @override
  Color get scaffold => const Color(0xff141414);

  @override
  Color get black => const Color(0xffffffff);

  @override
  Color get black2 => const Color(0xffF5F5F5);

  @override
  Color get white => const Color(0xff272626);

  @override
  Color get white2 => const Color(0xff2B2B2B);

  @override
  Color get stroke => const Color(0xff6795e8);

  @override
  Color get select => const Color(0xffE24E20);

  @override
  Color get success => const Color(0xff00af54);

  @override
  Color get warning => const Color(0xffFFC106);

  @override
  Color get error => const Color(0xffe3022c);

  @override
  Color get active => const Color(0xFFd32929);

  @override
  Color get icons => const Color(0xffEEEEEE);

  @override
  Color get lines => const Color(0xffF3F3F3);

  @override
  Color get background => const Color(0xff3D7DF6);

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
