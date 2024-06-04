import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/extensions/priority.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';

class PriorityWidget extends StatelessWidget {
  final int priority;

  const PriorityWidget({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final _color = priority.getPriorityColor;
    return Container(
      height: 30.h,
      padding: AppConstants.defaultHorizontalPadding,
      decoration: BoxDecoration(
        color: _color.withOpacity(0.25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            height: AppSizes.size16.h,
            child: SvgPicture.asset(priority.getPriorityFlag),
          ),
          AppSizes.size4.horizontalSpace,
          Text(
            priority.getPriorityTitle,
            style: StylesManager.extraBold(
                color: _color, fontSize: AppFonts.font.small.sp),
          ),
        ],
      ),
    );
  }
}
