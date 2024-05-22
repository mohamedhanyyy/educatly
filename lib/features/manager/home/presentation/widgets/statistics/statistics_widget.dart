import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';

class SingleStatisticsWidget extends StatelessWidget {
  final String? title;
  final int count;
  final Color color;
  final String iconPath;

  const SingleStatisticsWidget({
    super.key,
    required this.count,
    this.title,
    required this.color,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: AppConstants.defaultPadding,
        decoration: AppConstants.defaultBoxDecoration
            .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
        child: Row(children: [
          // ? Icon
          Container(
            width: AppSizes.size50.h,
            height: AppSizes.size50.h,
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.all(AppSizes.size12.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.15),
              border: Border.all(
                color: color.withOpacity(0.3),
              ),
            ),
            child: SvgPicture.asset(
              fit: BoxFit.fill,
              iconPath,
              colorFilter: color.toColorFilter,
              // BlendMode.srcIn,
            ),
          ),
          AppSizes.size16.horizontalSpace,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: AppSizes.size26.h,
                  child: FittedBox(
                    child: Text(
                      '$title',
                    ),
                  )),
              Text(
                '$count',
                style: StylesManager.regular(
                  fontSize: AppFonts.font.medium.sp,
                ),
              ),
            ],
          ))
        ]));
  }
}
