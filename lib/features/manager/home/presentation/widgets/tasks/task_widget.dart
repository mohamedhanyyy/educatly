import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/router/app_router_navigator.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/priority.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../admin/tasks/data/model/admin_tasks_model.dart';
import 'department_tag.dart';
import 'progress_count.dart';
import 'remaining_time.dart';

class ManagerTaskWidget extends ConsumerWidget {
  final AdminTasksModel taskDetails;
  List<bool> selected = [];
  double progress = 0;
  ManagerTaskWidget({super.key, required this.taskDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    progress = 0;
    selected.clear();
    taskDetails.subTasks!.forEach((e) {
      selected.add(e.isCompleted!);

      if (e.isCompleted!) progress++;
    });
    progress = progress / selected.length;

    return DecoratedBox(
      decoration: AppConstants.defaultBoxDecoration
          .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: AppConstants.defaultBorderRadius,
        shadowColor: Colors.grey,
        child: InkWell(
          onTap: () {
            AppRouter.router.pushTaskScreen(
                managerTaskDetails: '${json.encode(taskDetails)}');
          },
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 16.h,
                              height: 16.h,
                              child: SvgPicture.asset(
                                  taskDetails.priorityId!.getPriorityFlag)),
                          AppSizes.size10.horizontalSpace,
                          Flexible(
                            child: Text(
                              taskDetails.title!,
                              style: StylesManager.bold(
                                  fontSize: AppFonts.font.large.sp),
                            ),
                          )
                        ],
                      ),
                      AppSizes.size10.verticalSpace,
                      Row(
                        children: [
                          RemainingTimeWidget(
                              date: DateTime.parse(taskDetails.endDate!)),
                          AppSizes.size10.horizontalSpace,
                          StatusWidget(statusId: taskDetails.statusId)
                        ],
                      ),
                    ],
                  ),
                ),
                ProgressCountTaskWidget(progress: progress * 100)
              ],
            ).paddingAll(AppSizes.size24.sp),
          ),
        ),
      ),
    );
  }
}
