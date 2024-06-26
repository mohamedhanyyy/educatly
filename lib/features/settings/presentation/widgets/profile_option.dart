import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_system/app_colors.dart';
import '../../../../config/theme/font_system/app_fonts.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/styles_manager.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({
    super.key,
    this.onTap,
    this.trailing,
    required this.icon,
    required this.title,
    this.hasTrailing = true,
    this.hasLeading = true,
  });

  final String title;
  final IconData icon;
  final Widget? trailing;
  final bool hasTrailing;
  final bool hasLeading;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      horizontalTitleGap: AppSizes.size16.w,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSizes.size4.h,
        horizontal: AppSizes.size10.w,
      ),
      leading: hasLeading
          ? Container(
              width: 40.h,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.colors.background.withOpacity(0.15),
              ),
              child: Icon(
                icon,
                size: 22.sp,
                color: AppColors.colors.background,
              ),
            )
          : null,
      title: Text(
        title,
        style: StylesManager.semiBold(fontSize: AppFonts.font.medium.sp),
      ),
      trailing: hasTrailing
          ? trailing ?? const Icon(Icons.navigate_next_rounded)
          : null,
    );
  }
}
