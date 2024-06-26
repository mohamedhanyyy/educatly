import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../config/theme/color_system/app_colors.dart';
import '../../../../core/widgets/network_image.dart';

class ProfileAvatar extends StatelessWidget {
  final Function()? onTap;

  const ProfileAvatar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colors.background.withOpacity(0.15),
        ),
        child: PreferencesHelper.getUserModel?.imageName != null
            ? ClipOval(
                child: AppCachedNetworkImage(
                  '${AppConstants.subDomain}${PreferencesHelper.getUserModel?.imageName}',
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                child: const Icon(Icons.person_rounded),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
              ),
      ),
    );
  }
}
