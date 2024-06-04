import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/features/settings/presentation/controller/settings_controller.dart';

import '../../../../config/theme/font_system/app_fonts.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/styles_manager.dart';
import 'profile_avatar.dart';

class ProfileDetailsWidget extends ConsumerWidget {
  const ProfileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watcher = ref.watch(settingsControllerProvider);
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
              '${watcher.user?.fullName}',
              style: StylesManager.bold(
                fontSize: AppFonts.font.large.sp,
              ),
            ),
            Text(
              '${watcher.user?.email}',
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
