import 'package:flutter/widgets.dart';

import 'color_system/app_colors.dart';
import 'font_system/app_fonts.dart';

//TextStyle builder method
TextStyle _getTextStyle({
  Color? color,
  double? height,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  Color? decorationColor,
  TextOverflow? textOverflow,
  TextDecoration decoration = TextDecoration.none,
}) {
  return TextStyle(
    color: color,
    height: height,
    letterSpacing: 0,
    fontSize: fontSize,
    decoration: decoration,
    fontWeight: fontWeight,
    overflow: textOverflow,
    fontFamily: 'Cairo',
    decorationColor: decorationColor,
  );
}

/// Regular TextStyle = FontWeight.w400
class StylesManager {
  ///regular TextStyle = [FontWeight.w400],[FontWeight.normal]
  static TextStyle regular({
    Color? color,
    double? height,
    double fontSize = 10,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      height: height,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      decorationColor: decorationColor,
      fontFamily: 'Cairo',
      fontWeight: AppFonts.font.regularWeight,
    );
  }

  static TextStyle error({
    Color? color,
    double? height,
    double fontSize = 12,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: AppColors.colors.error,
      height: height,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      decorationColor: decorationColor,
      fontFamily: 'Cairo',
      fontWeight: AppFonts.font.regularWeight,
    );
  }

  /// Medium TextStyle = FontWeight.w500
  static TextStyle medium({
    Color? color,
    double? height,
    double fontSize = 10,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      height: height,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      decorationColor: decorationColor,
      fontFamily: 'Cairo',
      fontWeight: AppFonts.font.mediumWeight,
    );
  }

  /// Bold TextStyle = FontWeight.w700
  static TextStyle bold({
    Color? color,
    double? height,
    double fontSize = 10,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      height: height,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      decorationColor: decorationColor,
      fontWeight: AppFonts.font.boldWeight,
      fontFamily: 'Cairo',
    );
  }

  /// Light TextStyle = FontWeight.w300
  static TextStyle light({
    Color? color,
    double fontSize = 10,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      fontWeight: AppFonts.font.lightWeight,
      fontFamily: 'Cairo',
    );
  }

  /// SemiBold TextStyle = FontWeight.w600
  static TextStyle semiBold({
    Color? color,
    double? height,
    double fontSize = 10,
    Color? decorationColor,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      height: height,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      decorationColor: decorationColor,
      fontFamily: 'Cairo',
      fontWeight: AppFonts.font.semiBoldWeight,
    );
  }

  /// ExtraBold TextStyle = FontWeight.w800
  static TextStyle extraBold({
    Color? color,
    double fontSize = 10,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      fontSize: fontSize,
      color: color,
      decoration: decoration,
      textOverflow: textOverflow,
      fontFamily: 'Cairo',
      fontWeight: AppFonts.font.extraBoldWeight,
    );
  }

  /// Black TextStyle = FontWeight.w900
  static TextStyle black({
    Color? color,
    double fontSize = 10,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      fontWeight: AppFonts.font.blackWeight,
      fontFamily: 'Cairo',
    );
  }

// Thin TextStyle
  static TextStyle thin({
    Color? color,
    double fontSize = 10,
    TextOverflow? textOverflow,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return _getTextStyle(
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      textOverflow: textOverflow,
      fontFamily: 'Cairo',
      fontWeight: AppFonts.font.extraBoldWeight,
    );
  }
}
