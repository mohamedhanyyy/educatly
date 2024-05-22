import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/color_system/color_system_light.dart';
import 'package:taskaty/config/theme/styles_manager.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/admin_tasks_filter_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';

class AdminHomeSelectPriorityWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.read(adminTasksFilterControllerProvider.notifier);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppSizes.size20.h, bottom: AppSizes.size50.h),
            child: Text(S().priority, style: StylesManager.bold(fontSize: 24)),
          ),
          Divider(
            height: AppSizes.size10.h,
            thickness: 0.3,
            color: ColorSystemLight().black2,
          ),
          InkWell(
            onTap: () {
              reader.setData(selectedPriorityId: 1);
              AppRouter.router.pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S().low,
                      style: StylesManager.bold(
                          color: ColorSystemLight().success,
                          fontSize: AppSizes.size18.sp)),
                  SizedBox(width: AppSizes.size10.w),
                  SvgPicture.asset(Assets.icons.flag0)
                ],
              ),
            ),
          ),
          Divider(
            height: AppSizes.size10.h,
            thickness: 0.3,
            color: ColorSystemLight().black2,
          ),
          InkWell(
            onTap: () {
              reader.setData(selectedPriorityId: 2);

              AppRouter.router.pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S().medium,
                      style: StylesManager.bold(
                          color: ColorSystemLight().warning, fontSize: 18)),
                  SizedBox(width: AppSizes.size10.w),
                  SvgPicture.asset(Assets.icons.flag1)
                ],
              ),
            ),
          ),
          Divider(
            height: AppSizes.size10.h,
            thickness: 0.3,
            color: ColorSystemLight().black2,
          ),
          InkWell(
            onTap: () {
              reader.setData(selectedPriorityId: 3);

              AppRouter.router.pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S().high,
                      style: StylesManager.bold(
                          color: ColorSystemLight().error,
                          fontSize: AppSizes.size18.sp)),
                  SizedBox(width: AppSizes.size10.w),
                  SvgPicture.asset(Assets.icons.flag2)
                ],
              ),
            ),
          ),
          Divider(
            height: AppSizes.size10.h,
            thickness: 0.3,
          ),
          AppSizes.size10.verticalSpace,
        ],
      ),
    );
  }
}
