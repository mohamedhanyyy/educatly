import 'package:flutter/material.dart';

abstract class FontManagerBase {
  String get fontName;

  ///FontWeight.w200
  FontWeight get extraLightWeight;

  ///FontWeight.w300
  FontWeight get lightWeight;

  ///FontWeight.w500
  FontWeight get mediumWeight;

  ///FontWeight.w400
  FontWeight get regularWeight;

  ///FontWeight.w600
  FontWeight get semiBoldWeight;

  ///FontWeight.w700
  FontWeight get boldWeight;

  ///FontWeight.w800
  FontWeight get extraBoldWeight;

  ///FontWeight.w900
  FontWeight get blackWeight;

  /// 8.0
  double get xXSmall;

  /// 10.0
  double get xSmall;

  /// 12.0
  double get small;

  /// 14.0
  double get medium;

  /// 16.0
  double get large;

  /// 18.0
  double get xLarge;

  /// 20.0
  double get xXLarge;

  /// 24.0
  double get xXXLarge;
}
