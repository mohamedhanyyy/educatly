import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';

class TaskHeadLineWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Widget? trailing;

  const TaskHeadLineWidget({
    super.key,
    this.trailing,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSizes.size16.h,
          height: AppSizes.size16.h,
          child: SvgPicture.asset(icon),
        ),
        AppSizes.size6.horizontalSpace,
        Text(
          title,
          style: StylesManager.bold(
            fontSize: AppFonts.font.medium.sp,
          ),
        ),
        if (trailing != null) ...[Spacer(), trailing!]
      ],
    );
  }
}
