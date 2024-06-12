import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/widgets/notification_button.dart';
import '../../../../settings/presentation/widgets/profile_avatar.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NotificationButton(),
        SizedBox(
          width: AppSizes.size44.h,
          height: AppSizes.size44.h,
          child: ProfileAvatar(
            onTap: () => AppRouter.router.goNamed(AppRoutes.settings),
          ),
        ),
      ],
    );
  }
}
