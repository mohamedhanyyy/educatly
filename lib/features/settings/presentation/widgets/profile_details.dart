import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../config/theme/font_system/app_fonts.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/styles_manager.dart';
import 'profile_avatar.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 80.h,
            height: 80.h,
            child: ProfileAvatar(),
          ),
        ),
        AppSizes.size10.verticalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${PreferencesHelper.getUserModel?.fullName}',
              style: StylesManager.bold(
                fontSize: AppFonts.font.large.sp,
              ),
            ),
            Text(
              '${PreferencesHelper.getUserModel?.email}',
              style: StylesManager.medium(
                fontSize: AppFonts.font.medium.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
