import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/iterator_extension.dart';
import 'package:taskaty/core/helpers/mappers.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../manager/tasks/presentation/widgets/description/description_widget.dart';
import '../../../../manager/tasks/presentation/widgets/details/task_details.dart';
import '../../../../manager/tasks/presentation/widgets/info/task_info.dart';
import '../../../add_task/data/model/add_task_response.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AdminTasksModel taskDetails =
          AdminTasksModel.fromJson(jsonDecode(widget.taskaDetails));

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
    final reader = ref.read(editTaskControllerProvider.notifier);
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
          children: [
            TaskDetailsWidget(
              statusId: statusIdMapper(taskDetails.statusId),
              title: '${taskDetails.title}',
              priority: taskDetails.priorityId!,
              progressCount: 50,
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
              children: [
                if (watcher.subTasks?.isNotEmpty == true)
                  Column(
                      children: watcher.subTasks!.map((e) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: AppSizes.size5.h),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(AppSizes.size10),
                        border:
                            Border.all(color: Theme.of(context).disabledColor),
                      ),
                      child: CustomTextInputField(
                        // errorText: '',
                        label: null,
                        enabled: false,
                        prefix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.task_alt,
                              color: AppColors.colors.darkBlue),
                        ),
                        controller: TextEditingController(text: e.description),
                        textInputAction: TextInputAction.done,
                        validator: (value) =>
                            ValidationService.notEmptyField(value),
                        onSubmitted: (value) {
                          ref
                              .watch(editTaskControllerProvider)
                              .subTasks!
                              .map((e) {
                            // if (e.description == value) return;
                          }).toList();
                          reader.setTask(task: SubTasks(description: value));
                          reader.setData(isEditTask: false);
                        },
                      ).marginZero,
                    );
                  }).toList()),
                AppSizes.size16.verticalSpace,
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