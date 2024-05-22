import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/l10n/generated/l10n.dart';
import '../../config/theme/font_system/app_fonts.dart';
import '../../config/theme/sizes_manager.dart';
import '../../config/theme/styles_manager.dart';

class RefreshWidget extends StatelessWidget {
  final Function()? onTap;

  const RefreshWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.size20.h),
      child: Column(
        children: [
          Text(
            S().something_went_wrong,
            style: StylesManager.medium(fontSize: AppFonts.font.xLarge.sp),
          ),
          TextButton(
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S().refresh,
                  style: StylesManager.medium(
                    fontSize: AppFonts.font.xLarge.sp,
                  ),
                ),
                AppSizes.size10.horizontalSpace,
                Icon(size: 20.sp, Icons.refresh)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
