import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/config/theme/styles_manager.dart';
import 'package:taskaty/core/widgets/app_button.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';

Widget doneBottomSheet(String message) {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSizes.size40.h),
          child: SvgPicture.asset(Assets.icons.addTaskSuccess),
        ),
        AppSizes.size40.verticalSpace,
        Text(
          message,
          style: StylesManager.bold(fontSize: 18.sp),
        ),
        AppSizes.size20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: AppDefaultButton(
            onPressed: () {
              AppRouter.router.go(AppRoutes.adminHome);
            },
            text: S().home,
          ),
        ),
        AppSizes.size50.verticalSpace,
      ],
    ),
  );
}
