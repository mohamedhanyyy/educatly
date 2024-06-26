import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/color_system/app_colors.dart';
import '../../../config/theme/font_system/app_fonts.dart';
import '../../../config/theme/sizes_manager.dart';
import '../../../config/theme/styles_manager.dart';

enum ButtonStatus { initial, disabled, loading, success, error }

class AppButtonConstants {
  AppButtonConstants._();

  /// button color
  static Color? getButtonColor({
    Color? color,
    required ButtonStatus buttonStatus,
  }) {
    switch (buttonStatus) {
      case ButtonStatus.error:
        return AppColors.colors.error;
      case ButtonStatus.success:
        return AppColors.colors.success;
      default:
        return color ?? AppColors.colors.primary;
    }
  }

  /// button widget
  static Widget? getButtonWidget({
    String? title,
    Widget? widget,
    double? fontSize,
    Color? textColor,
    TextStyle? textStyle,
    required Color iconColor,
    required ButtonStatus buttonStatus,
  }) {
    switch (buttonStatus) {
      case ButtonStatus.loading:
        return SizedBox(
          width: AppSizes.size30.h,
          height: AppSizes.size30.h,
          child: const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
        );
      case ButtonStatus.success:
        return const Icon(
          color: Colors.white,
          Icons.check_circle_outline_outlined,
        );
      case ButtonStatus.error:
        return const Icon(
          color: Colors.white,
          Icons.error_outline_rounded,
        );
      case ButtonStatus.initial:
      default:
        if (title != null && title.trim().isNotEmpty) {
          return Text(
            title,
            style: textStyle ??
                StylesManager.bold(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize ?? AppFonts.font.large.sp,
                ),
          );
        }
        return widget;
    }
  }

  /// button Action
  static void Function()? getButtonAction({
    required Function()? function,
    required ButtonStatus buttonStatus,
  }) {
    switch (buttonStatus) {
      case ButtonStatus.error:
      case ButtonStatus.loading:
      case ButtonStatus.success:
        return () {};
      case ButtonStatus.disabled:
        return null;
      case ButtonStatus.initial:
      default:
        return function != null ? () => function() : null;
    }
  }
}
