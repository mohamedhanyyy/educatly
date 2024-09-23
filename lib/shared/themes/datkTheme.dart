import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          titleTextStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
          )));
}
