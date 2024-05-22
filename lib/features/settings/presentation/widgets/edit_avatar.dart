import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_system/app_colors.dart';
import '../../../../core/widgets/image_picker.dart';
import '../controller/avatar_controller.dart';
import 'profile_avatar.dart';

class EditAvatarWidget extends ConsumerWidget {
  const EditAvatarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return badges.Badge(
      badgeContent: Icon(
        Icons.add,
        size: 20.h,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      badgeAnimation: badges.BadgeAnimation.scale(),
      position: badges.BadgePosition.bottomEnd(end: 9.h, bottom: 0),
      badgeStyle: badges.BadgeStyle(
        padding: EdgeInsets.all(5.h),
        badgeColor: AppColors.colors.primary,
      ),
      onTap: () async => await PickerDialog().pickGalleryImage(
        onGet: (image) =>
            ref.read(avatarControllerProvider.notifier).updateAvatar(image),
      ),
      child: ref.watch(avatarControllerProvider) != null
          ? Container(
              width: 120.h,
              height: 120.h,
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colors.background.withOpacity(0.15),
              ),
              child: ClipOval(
                child: Image.file(
                  ref.watch(avatarControllerProvider)!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : SizedBox(
              width: 120.h,
              height: 120.h,
              child: ProfileAvatar(),
            ),
    );
  }
}
