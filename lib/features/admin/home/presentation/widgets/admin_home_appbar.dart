import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/core/extensions/context_extension.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';
import 'package:taskaty/core/widgets/notification_button.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/controllers/theme/theme_controller.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AdminHomeAppBar extends ConsumerWidget {
  const AdminHomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: AppSizes.size300.h,
        child: Stack(
          children: [
            Image.asset(
              ref.watch(themeControllerProvider) == ThemeMode.dark
                  ? 'assets/images/headerBackGroundBlack.jpg'
                  : 'assets/images/adminBackground.png',
              width: ScreenUtil().screenWidth,
              height: 144.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  context.isCurrentArabic ? AppSizes.size15.w : 0,
                  10.h,
                  context.isCurrentArabic ? 0 : AppSizes.size15.w,
                  0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Flexible(
                    child: Text(
                      "${S().hello} ${PreferencesHelper.getUserModel?.fullName ?? '---'}",
                      style: StylesManager.semiBold(fontSize: 23.sp),
                    ),
                  ),
                  const NotificationButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
