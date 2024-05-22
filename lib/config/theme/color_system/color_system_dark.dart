import 'package:flutter/material.dart';

import 'color_system_base.dart';

class ColorSystemDark extends ColorSystemBase {
  @override
  Color get primary => Color(0xFF3D7DF6);

  @override
  Color get appBar => Color(0xff272626);

  @override
  Color get scaffold => Color(0xff141414);

  @override
  Color get black => Color(0xffffffff);

  @override
  Color get black2 => Color(0xffF5F5F5);

  @override
  Color get white => Color(0xff272626);

  @override
  Color get white2 => Color(0xff2B2B2B);

  @override
  Color get stroke => Color(0xff6795e8);

  @override
  Color get select => Color(0xffE24E20);

  @override
  Color get success => Color(0xff00af54);

  @override
  Color get warning => Color(0xffFFC106);

  @override
  Color get error => Color(0xffe3022c);

  @override
  Color get active => Color(0xFFd32929);

  @override
  Color get icons => Color(0xffEEEEEE);

  @override
  Color get lines => Color(0xffF3F3F3);

  @override
  Color get background => Color(0xff3D7DF6);

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
