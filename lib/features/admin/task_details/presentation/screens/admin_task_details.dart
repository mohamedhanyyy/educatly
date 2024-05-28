import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/iterator_extension.dart';
import 'package:taskaty/core/helpers/mappers.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../manager/tasks/presentation/widgets/description/description_widget.dart';
import '../../../../manager/tasks/presentation/widgets/details/task_details.dart';
import '../../../../manager/tasks/presentation/widgets/info/task_info.dart';
import '../../../edit_task/presentation/controller/edit_task_controller.dart';
import '../../../edit_task/presentation/widgets/delete_task_widget.dart';
import '../../../tasks/data/model/admin_tasks_model.dart';

class AdminTaskDetails extends ConsumerStatefulWidget {
  AdminTaskDetails({super.key, required this.taskaDetails});

  final String taskaDetails;
  static final buttonKey = UniqueKey();

  @override
  ConsumerState<AdminTaskDetails> createState() => _AdminTaskDetailsState();
}

class _AdminTaskDetailsState extends ConsumerState<AdminTaskDetails> {
  int progressCount = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AdminTasksModel taskDetails =
          AdminTasksModel.fromJson(jsonDecode(widget.taskaDetails));

      taskDetails.subTasks!.map((e) {
        if (e.isCompleted!) progressCount++;
      }).toList();
      ref.read(editTaskControllerProvider.notifier).setData(
            selectedPriority: (taskDetails.priorityId),
            taskTitle: taskDetails.title,
            taskId: taskDetails.id,
            statusId: taskDetails.statusId,
            tasks: taskDetails.subTasks,
            taskDescription: taskDetails.description,
            startDate: DateTime.parse(taskDetails.startDate!),
            endDate: DateTime.parse(taskDetails.endDate!),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    AdminTasksModel taskDetails =
        AdminTasksModel.fromJson(jsonDecode(widget.taskaDetails));
    final watcher = ref.watch(editTaskControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S().task_details),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => TaskActionWidget(taskDetails));
              },
              icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskDetailsWidget(
              statusId: statusIdMapper(taskDetails.statusId),
              title: '${taskDetails.title}',
              priority: taskDetails.priorityId!,
              progressCount: progressCount / taskDetails.subTasks!.length,
              departmentTag: '${taskDetails.description}',
            ),
            TaskInfoWidget(
              userName: '${taskDetails.userName}',
              userImage: 'taskDetails',
              endDate: DateTime.parse(taskDetails.endDate!),
              startDate: DateTime.parse(taskDetails.startDate!),
            ),
            DescriptionWidget(description: '${taskDetails.description}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizes.size10.verticalSpace,
                Text(S().subtasks),
                if (watcher.subTasks?.isNotEmpty == true)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: watcher.subTasks!
                          .map(
                            (e) => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.size5.h),
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.size5.h),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                                borderRadius:
                                    BorderRadius.circular(AppSizes.size10),
                                border: Border.all(
                                    color: Theme.of(context).disabledColor),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(Icons.task_alt_outlined,
                                        color: e.isCompleted == true
                                            ? AppColors.colors.green
                                            : Colors.black),
                                  ),
                                  Flexible(child: Text(e.description!)),
                                ],
                              ).marginZero,
                            ),
                          )
                          .toList()),
                AppSizes.size10.verticalSpace,
                Text(S().comments),
                if (taskDetails.comments?.isNotEmpty == true)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: taskDetails.comments!.map((e) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 2),
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Theme.of(context).highlightColor),
                              color: Theme.of(context).scaffoldBackgroundColor),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.comments,
                                // color: Theme.of(context).primaryColor,
                              ),
                              AppSizes.size10.horizontalSpace,
                              Flexible(child: Text(e.description!)),
                            ],
                          ),
                        );
                      }).toList())
              ],
            ),
          ].addSeparator(child: AppSizes.size20.verticalSpace).toList(),
        ).paddingSymmetric(
          vertical: AppSizes.size20.h,
          horizontal: AppSizes.size10.w,
        ),
      ),
    );
  }
}
