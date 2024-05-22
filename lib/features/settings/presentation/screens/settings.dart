import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/l10n/generated/l10n.dart';
import '../../../../config/router/app_router.dart';
import '../../../../config/router/app_routing_paths.dart';
import '../../../../config/theme/font_system/app_fonts.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/styles_manager.dart';
import '../../../../config/theme/widget_manager.dart';
import '../../../../core/controllers/theme/theme_controller.dart';
import '../widgets/profile_details.dart';
import '../widgets/profile_option.dart';
import '../widgets/sheets/language_sheet.dart';
import '../widgets/sheets/logout_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDetailsWidget(),

              ...[
                Text(
                  S().personal_info,
                  style: StylesManager.bold(
                    fontSize: AppFonts.font.large.sp,
                  ),
                ).paddingSymmetric(vertical: AppSizes.size10.h),
                ProfileOption(
                  title: S().edit_profile,
                  icon: Icons.account_circle_outlined,
                  onTap: () =>
                      AppRouter.router.pushNamed(AppRoutes.editProfile),
                ),
                AppSizes.size10.verticalSpace,
                ProfileOption(
                  title: S().change_password,
                  icon: Icons.lock_outline_rounded,
                  onTap: () =>
                      AppRouter.router.pushNamed(AppRoutes.changePassword),
                ),
                AppSizes.size10.verticalSpace,
                ProfileOption(
                  title: S().notifications,
                  icon: Icons.notifications_none_rounded,
                  onTap: () =>
                      AppRouter.router.pushNamed(AppRoutes.notifications),
                ),
              ],

              //?/ Privacy Policy
              ...[
                Text(
                  S().app_settings,
                  style: StylesManager.bold(
                    fontSize: AppFonts.font.large.sp,
                  ),
                ).paddingSymmetric(vertical: AppSizes.size10.h),
                ProfileOption(
                  title: S().privacy_policy,
                  icon: Icons.policy_outlined,
                  onTap: () =>
                      AppRouter.router.pushNamed(AppRoutes.privacyPolicy),
                ),
                AppSizes.size10.verticalSpace,
                ProfileOption(
                  title: S().app_lang,
                  icon: Icons.language_rounded,
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      builder: (context) => LanguageSheet(),
                    );
                  },
                ),
                AppSizes.size10.verticalSpace,
                ProfileOption(
                  title: S().dark_mood,
                  icon: Icons.dark_mode_outlined,
                  trailing: Consumer(
                    builder: (context, ref, child) {
                      return Switch.adaptive(
                        inactiveTrackColor: Theme.of(context).primaryColor,
                        value: ref.watch(themeControllerProvider) ==
                            ThemeMode.dark,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          ref
                              .read(themeControllerProvider.notifier)
                              .setThemeMode(
                                  value ? ThemeMode.dark : ThemeMode.light);
                        },
                      );
                    },
                  ),
                ),
                AppSizes.size10.verticalSpace,
              ],

              //?/ Logout
              ProfileOption(
                title: S().logout,
                // hasTrailing: false,
                icon: Icons.logout_rounded,
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (context) => LogoutSheet(),
                  );
                },
              ),
            ],
          ).defaultScreenPadding,
        ),
      ),
    );
  }
}
