import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/styles_manager.dart';

class ProgressCountWidget extends StatelessWidget {
  final int progress;
  final double size;

  const ProgressCountWidget({
    super.key,
    this.size = 70,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.h,
      height: size.h,
      child: FittedBox(
        child: CircularPercentIndicator(
          percent: progress / 100,
          radius: (size / 2).h,
          lineWidth: 10.h,
          progressColor: AppColors.colors.primary,
          backgroundColor: AppColors.colors.primary.withOpacity(0.2),
          center: SizedBox(
            width: (size / 2).sp,
            child: FittedBox(
              child: Text(
                "${progress}%",
                style: StylesManager.bold(
                  color: AppColors.colors.primary,
                  fontSize: AppFonts.font.large.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
