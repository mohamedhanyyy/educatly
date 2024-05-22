import 'dart:ui';

import 'font_manager_base.dart';

class CairoFont extends FontManagerBase {
  @override
  String get fontName => "Cairo";

  ///FontWeight.w200
  @override
  FontWeight get extraLightWeight => FontWeight.w200;

  ///FontWeight.w300
  @override
  FontWeight get lightWeight => FontWeight.w300;

  ///FontWeight.w400
  @override
  FontWeight get regularWeight => FontWeight.w400;

  ///FontWeight.w500
  @override
  FontWeight get mediumWeight => FontWeight.w500;

  ///FontWeight.w600
  @override
  FontWeight get semiBoldWeight => FontWeight.w600;

  ///FontWeight.w700
  @override
  FontWeight get boldWeight => FontWeight.w700;

  ///FontWeight.w800
  @override
  FontWeight get extraBoldWeight => FontWeight.w800;

  ///FontWeight.w900
  @override
  FontWeight get blackWeight => FontWeight.w900;

  /// 8.0
  @override
  double get xXSmall => 8.0;

  /// 10.0
  @override
  double get xSmall => 10.0;

  /// 12.0
  @override
  double get small => 12.0;

  /// 14.0
  @override
  double get medium => 14.0;

  /// 16.0
  @override
  double get large => 16.0;

  /// 18.0
  @override
  double get xLarge => 18.0;

  /// 20.0
  @override
  double get xXLarge => 20.0;

  /// 24.0
  @override
  double get xXXLarge => 24.0;
}
