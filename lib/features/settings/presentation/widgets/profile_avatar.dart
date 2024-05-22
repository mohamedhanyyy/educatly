import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: 1 == 2
            ? ClipOval(
                child: AppCachedNetworkImage(
                  "",
                  fit: BoxFit.fitHeight,
                ),
              )
            : Container(
                child: Icon(Icons.person_rounded),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
              ),
      ),
    );
  }
}
