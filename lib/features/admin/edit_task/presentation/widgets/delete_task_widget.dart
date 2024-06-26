import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/config/theme/styles_manager.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_router_keys.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../delete_task/presentation/controller/delete_task_controller.dart';
import '../../../tasks/data/model/admin_tasks_model.dart';

class DeleteTaskWidget extends ConsumerWidget {
  static final buttonKey = UniqueKey();
  final id;

  DeleteTaskWidget({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
            child: SvgPicture.asset('assets/icons/deleteTask.svg')),
        Text(
          S().do_you_want_to_delete_task,
          style: StylesManager.bold(fontSize: 15.sp),
        ),
        // Spacer(),
        Padding(
            padding: EdgeInsets.only(bottom: 30.h, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppDefaultButton(
                  onPressed: () {
                    AppRouter.router.pop();
                  },
                  width: AppSizes.size150.w,
                  height: AppSizes.size45.h,
                  borderColor: ColorSystemLight().primary,
                  isBordered: true,
                  text: S().cancel,
                  textColor: ColorSystemLight().primary,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                AppSizes.size30.horizontalSpace,
                Consumer(
                  builder: (_, ref, __) {
                    return AppDefaultButton(
                      key: buttonKey,
                      width: AppSizes.size150.w,
                      height: AppSizes.size45.h,
                      borderColor: ColorSystemLight().scaffold,
                      isBordered: true,
                      text: S().delete,
                      textColor: ColorSystemLight().scaffold,
                      backgroundColor: ColorSystemLight().primary,
                      onPressed: () {
                        ref
                            .read(deleteTaskControllerProvider.notifier)
                            .deleteTask(id: id, key: buttonKey);
                      },
                    );
                  },
                ),
              ],
            )),
      ],
    );
  }
}

class TaskActionWidget extends StatelessWidget {
  final AdminTasksModel task;
  TaskActionWidget(this.task, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.size44.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              AppRouter.router.pop();

              AppRouter.router.pushNamed(
                AppRoutes.editTask,
                queryParameters: {AppRouterKeys.editTask: jsonEncode(task)},
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 50.w,
                    child: SvgPicture.asset(
                      'assets/icons/editTask.svg',
                      colorFilter:
                          Theme.of(context).secondaryHeaderColor.toColorFilter,
                    )),
                Text(
                  S().edit,
                  style: StylesManager.bold(
                      fontSize: 18.sp,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              ],
            ),
          ),
          Divider(
            height: AppSizes.size70.h,
            color: Colors.black,
            thickness: .1,
          ),
          InkWell(
            onTap: () {
              AppRouter.router.pop();
              showModalBottomSheet(
                  context: context,
                  builder: (context) => DeleteTaskWidget(id: task.id));
            },
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50.w,
                      child: SvgPicture.asset(
                        'assets/icons/deleteTask2.svg',
                        colorFilter: Theme.of(context)
                            .secondaryHeaderColor
                            .toColorFilter,
                      )),
                  Text(
                    S().delete,
                    style: StylesManager.bold(
                        fontSize: 18.sp,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
