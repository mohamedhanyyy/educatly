import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sizes_manager.dart';

/// add Padding Property to widget
extension WidgetPaddingX on Widget {
  List<Widget> operator *(times) => List.generate(times, (index) => this);

  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        child: this,
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
      );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        child: this,
        padding:
            EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      );

  Widget get horizontalScreenPadding => Padding(
        child: this,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
      );

  Widget get verticalScreenPadding => Padding(
        child: this,
        padding: EdgeInsets.symmetric(vertical: AppSizes.size10.h),
      );

  Widget get defaultScreenPadding => Padding(
        child: this,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.size10.h,
          horizontal: AppSizes.size10.w,
        ),
      );
}

/// Add margin property to widget
extension WidgetMarginX on Widget {
  Widget marginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin:

          EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Container(
          margin: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: this);

  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}
