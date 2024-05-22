import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../config/router/app_router.dart';
import '../../config/router/app_routing_paths.dart';
import '../../config/theme/color_system/app_colors.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: InkWell(
        onTap: () => AppRouter.router.pushNamed(AppRoutes.notifications),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.colors.darkBlue.withOpacity(.4),
          ),
          child: Lottie.asset('assets/json/notification.json'),
        ),
      ),
    );
  }
}
