import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/color_system/color_system_light.dart';
import 'package:taskaty/config/theme/styles_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../controller/edit_task_controller.dart';

class EditStatusWidget extends ConsumerWidget {
  const EditStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(editTaskControllerProvider.notifier);

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSizes.size20.h),
            child: Text(S().status, style: StylesManager.bold(fontSize: 24)),
          ),
          Divider(
            height: AppSizes.size50.h,
            thickness: 0.3,
            color: ColorSystemLight().black2,
          ),
          SizedBox(
            width: 400,
            child: GestureDetector(
              onTap: () {
                ref
                    .read(editTaskControllerProvider.notifier)
                    .setData(statusId: 1);

                AppRouter.router.pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S().neww,
                      style: StylesManager.bold(
                          color: ColorSystemLight().success,
                          fontSize: AppSizes.size18.sp)),
                  SizedBox(width: AppSizes.size10.w),
                  // SvgPicture.asset(Assets.icons.flag0)
                ],
              ),
            ),
          ),
          Divider(
            height: AppSizes.size50.h,
            thickness: 0.3,
            color: ColorSystemLight().black2,
          ),
          GestureDetector(
            onTap: () {
              ref
                  .read(editTaskControllerProvider.notifier)
                  .setData(statusId: 2);

              AppRouter.router.pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S().in_progress,
                    style: StylesManager.bold(
                        color: ColorSystemLight().warning, fontSize: 18)),
                SizedBox(width: AppSizes.size10.w),
                // SvgPicture.asset(Assets.icons.flag1)
              ],
            ),
          ),
          Divider(
            height: AppSizes.size50.h,
            thickness: 0.3,
            color: ColorSystemLight().black2,
          ),
          GestureDetector(
            onTap: () {
              ref
                  .read(editTaskControllerProvider.notifier)
                  .setData(statusId: 3);
              AppRouter.router.pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S().completed,
                    style: StylesManager.bold(
                        color: ColorSystemLight().error,
                        fontSize: AppSizes.size18.sp)),
                SizedBox(width: AppSizes.size10.w),
                // SvgPicture.asset(Assets.icons.flag2)
              ],
            ),
          ),
          Divider(
            height: AppSizes.size50.h,
            thickness: 0.3,
          ),
          AppSizes.size10.verticalSpace,
        ],
      ),
    );
  }
}
