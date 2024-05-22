import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/widgets/network_image.dart';

class UserWidget extends StatelessWidget {
  final String userName;
  final String userImage;

  const UserWidget(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.size50.h,
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: AppSizes.size30.h,
              height: AppSizes.size30.h,
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(AppSizes.size2.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colors.background.withOpacity(0.5),
              ),
              child: ClipOval(
                child: AppCachedNetworkImage(userImage),
              ),
            ),
            Text(
              userName,
              style: StylesManager.light(
                fontSize: AppFonts.font.medium.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}