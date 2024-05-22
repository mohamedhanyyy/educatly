import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/router/app_router_navigator.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/priority.dart';
import 'package:taskaty/core/helpers/mappers.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../admin/tasks/data/model/admin_tasks_model.dart';
import 'department_tag.dart';
import 'progress_count.dart';
import 'remaining_time.dart';

class TaskWidget extends ConsumerWidget {
  final AdminTasksModel managerTaskDetails;

  const TaskWidget({super.key, required this.managerTaskDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                managerTaskDetails: json.encode(managerTaskDetails).toString());
          },
          child: SizedBox(
            height: 120.h,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // ? Priority
                          SizedBox(
                            width: 16.h,
                            height: 16.h,
                            child: SvgPicture.asset(
                                managerTaskDetails.priorityId!.getPriorityFlag),
                          ),
                          AppSizes.size10.horizontalSpace,
                          // ? Title
                          Text(
                            managerTaskDetails.title!,
                            style: StylesManager.bold(
                              fontSize: AppFonts.font.large.sp,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RemainingTimeWidget(
                              date:
                                  DateTime.parse(managerTaskDetails.endDate!)),
                          AppSizes.size10.horizontalSpace,
                          DepartmentTagWidget(
                              tag: statusIdMapper(managerTaskDetails.statusId))
                        ],
                      ),
                    ],
                  ),
                ),
                ProgressCountWidget(progress: 1)
              ],
            ).paddingAll(AppSizes.size24.sp),
          ),
        ),
      ),
    );
  }
}