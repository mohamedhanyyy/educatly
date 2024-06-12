import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/config/theme/styles_manager.dart';
import 'package:taskaty/core/controllers/theme/theme_controller.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../../settings/presentation/widgets/sheets/language_sheet.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: 200.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                  ref.watch(themeControllerProvider) == ThemeMode.dark
                      ? 'assets/images/headerBackGroundBlack.jpg'
                      : 'assets/images/backGroundBlue.png',
                  fit: BoxFit.fill,
                  width: 240.w),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    clipBehavior: Clip.antiAlias,
                    child: AppCachedNetworkImage(
                      AppConstants.userAvatar,
                      width: 66.w,
                      height: 66.w,
                      fit: BoxFit.cover,
                    )),
              )
            ],
          ),
          buildDrawerItemWidget(
              title: S().home, icon: 'home', route: 'home', context: context),
          buildDrawerItemWidget(
            title: S().tasks,
            icon: 'tasks',
            route: AppRoutes.adminTasks,
            context: context,
          ),
          buildDrawerItemWidget(
              title: S().companies,
              icon: 'companies',
              context: context,
              route: AppRoutes.getCompanies),
          buildDrawerItemWidget(
              title: S().managers,
              icon: 'managers',
              context: context,
              route: AppRoutes.getManagers),
          buildDrawerItemWidget(
            title: S().language,
            icon: 'language',
            route: 'lang',
            context: context,
          ),
        ],
      ),
    );
  }

  buildDrawerItemWidget(
      {required String title,
      required String icon,
      String? route,
      BuildContext? context}) {
    return InkWell(
      onTap: () async {
        if (route == 'home') {
          AppRouter.router.pop();
        }
        if (route == 'lang') {
          await showModalBottomSheet(
            context: context,
            showDragHandle: true,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context) => LanguageSheet(),
          );
        } else if (route != null) {
          AppRouter.router.pop();
          AppRouter.router.push(route);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
              colorFilter:
                  Theme.of(context!).secondaryHeaderColor.toColorFilter,
            ),
            AppSizes.size10.horizontalSpace,
            Text(
              title,
              style: StylesManager.semiBold(
                  fontSize: 16.sp,
                  color: Theme.of(context).secondaryHeaderColor),
            )
          ],
        ),
      ),
    );
  }
}
