import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/router/app_router.dart';

import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';

Widget customDropDown({
  required String title,
  required Function function,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  Widget? widget,
}) {
  return GestureDetector(
    onTap: () => function(),
    child: Container(
      height: AppSizes.size50.h,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.size8),
          border: Border.all(
              color: Theme.of(AppRouter.navigatorState.currentContext!)
                  .focusColor)),
      child: Center(
          child: Row(
        children: [
          if (widget != null) widget,
          if (widget != null) AppSizes.size10.horizontalSpace,
          Text(
            title,
            style: TextStyle(
                fontSize: fontSize ?? AppSizes.size12.sp,
                color: textColor,
                fontWeight: fontWeight),
          ),
          const Spacer(),
          SvgPicture.asset(Assets.icons.dropdownButton)
        ],
      )),
    ),
  );
}
