import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/extensions/date.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';

class RemainingTimeWidget extends StatelessWidget {
  final DateTime date;

  const RemainingTimeWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: AppConstants.defaultHorizontalPadding,
      decoration: BoxDecoration(
        color: const Color(0xff01DF85).withOpacity(0.3),
        borderRadius: AppConstants.defaultBorderRadius,
        border: Border.all(
          color: const Color(0xff01DF85),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Text(
            date.getDifferenceFromToday(),
            style: StylesManager.extraBold(
              color: const Color(0xff01DF85),
              fontSize: AppFonts.font.small.sp,
            ),
          ),
          AppSizes.size4.horizontalSpace,
          SizedBox(
            height: AppSizes.size16.h,
            child: const FittedBox(
              child: Icon(
                Icons.access_time_rounded,
                color: Color(0xff01DF85),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
