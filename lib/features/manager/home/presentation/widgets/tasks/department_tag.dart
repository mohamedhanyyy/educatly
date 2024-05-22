import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';

class DepartmentTagWidget extends StatelessWidget {
  const DepartmentTagWidget({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: AppConstants.defaultHorizontalPadding,
      decoration: BoxDecoration(
        color: AppColors.colors.primary.withOpacity(0.3),
        borderRadius: AppConstants.defaultBorderRadius,
        border: Border.all(
          color: AppColors.colors.primary,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        tag,
        style: StylesManager.extraBold(
          color: AppColors.colors.primary,
          fontSize: AppFonts.font.small.sp,
        ),
      ),
    );
  }
}
