import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/sizes_manager.dart';
import '../../core/constants/constants.dart';
import 'color_system/app_colors.dart';
import 'font_system/app_fonts.dart';
import 'styles_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData get getLightMode {
    AppColors.i.themeMode = ThemeMode.light;
    return ThemeData(
      useMaterial3: true,
      secondaryHeaderColor: Colors.black,
      splashColor: Colors.transparent,
      cardColor: Colors.grey.shade300,
      fontFamily: 'Cairo',
      visualDensity: VisualDensity.standard,
      disabledColor: AppColors.colors.white2,
      primaryColorLight: AppColors.colors.appBar,
      dialogBackgroundColor: AppColors.colors.scaffold,
      scaffoldBackgroundColor: AppColors.colors.scaffold,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        cardColor: AppColors.colors.appBar,
        errorColor: AppColors.colors.error,
        accentColor: AppColors.colors.select,
        backgroundColor: AppColors.colors.scaffold,
        primarySwatch: getMaterialColor(AppColors.colors.select),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.colors.black,
          backgroundColor: AppColors.colors.scaffold,
          surfaceTintColor: AppColors.colors.scaffold,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.colors.scaffold,
      ),
      datePickerTheme: DatePickerThemeData(
        elevation: 0.0,
        shadowColor: AppColors.colors.appBar,
        dividerColor: AppColors.colors.black2,
        backgroundColor: AppColors.colors.scaffold,
        surfaceTintColor: AppColors.colors.scaffold,
        dayOverlayColor: WidgetStateProperty.all(AppColors.colors.select),
      ),
      timePickerTheme: TimePickerThemeData(
        elevation: 0.0,
        dayPeriodTextColor: AppColors.colors.black,
        backgroundColor: AppColors.colors.scaffold,
        dialBackgroundColor: AppColors.colors.appBar,
        dayPeriodBorderSide: BorderSide(color: AppColors.colors.appBar),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.colors.primary,
        surfaceTintColor: AppColors.colors.scaffold,
        iconTheme: IconThemeData(color: AppColors.colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: StylesManager.bold(
          color: AppColors.colors.white,
          fontSize: 23.sp,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        // isDense: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: AppPaddings.small.sp,
          horizontal: AppSizes.size8.w,
        ),

        fillColor: AppColors.colors.appBar,
        // floatingLabelBehavior: FloatingLabelBehavior.auto,

        hintStyle: StylesManager.regular(
          height: 1,
          color: AppColors.colors.black2,
          fontSize: AppFonts.font.small.sp,
        ),
        // labelStyle: StylesManager.regular(
        //   height: 1,
        //   color: AppColors.colors.black2,
        //   fontSize: AppFonts.font.medium.sp,
        // ),
        // floatingLabelStyle: StylesManager.regular(
        //   height: 1,
        //   color: AppColors.colors.black2,
        //   fontSize: AppFonts.font.small.sp,
        // ),
      ),
      listTileTheme: ListTileThemeData(
        enableFeedback: true,
        iconColor: AppColors.colors.black,
        textColor: AppColors.colors.black,
        tileColor: AppColors.colors.appBar,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.defaultBorderRadius,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0.0,
        modalElevation: 0.0,
        clipBehavior: Clip.antiAlias,
        dragHandleColor: Colors.grey.shade300,
        backgroundColor: AppColors.colors.scaffold,
        surfaceTintColor: AppColors.colors.scaffold,
        dragHandleSize: Size(AppSizes.size48.w, AppSizes.size4.h),
        constraints: BoxConstraints(
          minWidth: ScreenUtil().screenWidth,
          maxHeight: ScreenUtil().screenHeight * 0.9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.size20.r),
            topRight: Radius.circular(AppSizes.size20.r),
          ),
        ),
      ),
    );
  }

  static ThemeData get getDarkMode {
    AppColors.i.themeMode = ThemeMode.dark;
    return ThemeData(
      useMaterial3: true,
      cardColor: Colors.grey.shade800,
      secondaryHeaderColor: Colors.white,
      splashColor: Colors.transparent,
      visualDensity: VisualDensity.standard,
      fontFamily: 'Cairo',
      disabledColor: AppColors.colors.white2,
      primaryColorLight: AppColors.colors.appBar,
      dialogBackgroundColor: AppColors.colors.scaffold,
      scaffoldBackgroundColor: AppColors.colors.scaffold,
      primarySwatch: getMaterialColor(AppColors.colors.scaffold),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        cardColor: AppColors.colors.appBar,
        errorColor: AppColors.colors.error,
        accentColor: AppColors.colors.select,
        backgroundColor: AppColors.colors.scaffold,
        primarySwatch: getMaterialColor(AppColors.colors.select),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.colors.black,
          backgroundColor: AppColors.colors.scaffold,
          surfaceTintColor: AppColors.colors.scaffold,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.colors.scaffold,
      ),
      datePickerTheme: DatePickerThemeData(
        shadowColor: AppColors.colors.appBar,
        dividerColor: AppColors.colors.black2,
        backgroundColor: AppColors.colors.scaffold,
        surfaceTintColor: AppColors.colors.scaffold,
        dayOverlayColor: WidgetStateProperty.all(AppColors.colors.select),
      ),
      timePickerTheme: TimePickerThemeData(
        elevation: 0.0,
        dayPeriodTextColor: AppColors.colors.black,
        backgroundColor: AppColors.colors.scaffold,
        dialBackgroundColor: AppColors.colors.appBar,
        dayPeriodBorderSide: BorderSide(color: AppColors.colors.appBar),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.colors.scaffold,
        surfaceTintColor: AppColors.colors.scaffold,
        iconTheme: IconThemeData(color: AppColors.colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: StylesManager.bold(
          color: AppColors.colors.black,
          fontSize: AppFonts.font.xLarge.sp,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        isDense: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          vertical: AppPaddings.small.sp,
          horizontal: AppPaddings.xLarge.sp,
        ),
        fillColor: AppColors.colors.appBar,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: StylesManager.regular(
          height: 1,
          color: AppColors.colors.black2,
          fontSize: AppFonts.font.small.sp,
        ),
        labelStyle: StylesManager.regular(
          height: 1,
          color: AppColors.colors.black2,
          fontSize: AppFonts.font.medium.sp,
        ),
        floatingLabelStyle: StylesManager.regular(
          height: 1,
          color: AppColors.colors.black2,
          fontSize: AppFonts.font.small.sp,
        ),
      ),
      listTileTheme: ListTileThemeData(
        enableFeedback: true,
        iconColor: AppColors.colors.black,
        textColor: AppColors.colors.black,
        tileColor: AppColors.colors.appBar,
        visualDensity: VisualDensity.standard,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.defaultBorderRadius,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0.0,
        modalElevation: 0.0,
        clipBehavior: Clip.antiAlias,
        dragHandleColor: Colors.grey.shade800,
        backgroundColor: AppColors.colors.scaffold,
        surfaceTintColor: AppColors.colors.scaffold,
        dragHandleSize: Size(AppSizes.size48.w, AppSizes.size4.h),
        constraints: BoxConstraints(
          minWidth: ScreenUtil().screenWidth,
          maxHeight: ScreenUtil().screenHeight * 0.9,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.size20.r),
            topRight: Radius.circular(AppSizes.size20.r),
          ),
        ),
      ),
    );
  }
}
