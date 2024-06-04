import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../../config/theme/styles_manager.dart';
import '../../../../../../../config/theme/widget_manager.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../controller/settings_controller.dart';

class LogoutSheet extends StatelessWidget {
  const LogoutSheet({super.key});

  static final Key buttonKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S().logout,
            textAlign: TextAlign.center,
            style: StylesManager.bold(
              fontSize: AppFonts.font.large.sp,
            ),
          ),
          AppSizes.size10.verticalSpace,
          Text(
            S().logout_desc,
            textAlign: TextAlign.center,
            style: StylesManager.regular(
              fontSize: AppFonts.font.medium.sp,
            ),
          ),
          AppSizes.size20.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              return AppDefaultButton(
                key: buttonKey,
                text: S().logout,
                width: ScreenUtil().screenWidth,
                backgroundColor: AppColors.colors.error,
                onPressed: () async {
                  ref
                      .read(settingsControllerProvider.notifier)
                      .logout(buttonKey);
                },
              );
            },
          ),
          AppSizes.size10.verticalSpace,
          AppDefaultButton(
            text: S().cancel,
            width: ScreenUtil().screenWidth,
            backgroundColor: AppColors.colors.primary,
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ).defaultScreenPadding,
    );
  }
}
