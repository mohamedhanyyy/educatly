import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/core/helpers/mappers.dart';
import 'package:taskaty/features/admin/edit_task/presentation/controller/edit_task_controller.dart';
import 'package:taskaty/features/admin/edit_task/presentation/widgets/admin_subtasks_widget.dart';
import 'package:taskaty/features/admin/edit_task/presentation/widgets/edit_priority.dart';
import 'package:taskaty/features/admin/edit_task/presentation/widgets/edit_status.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../add_task/presentation/widgets/custom_dropdown.dart';
import '../widgets/edit_task_appbar.dart';
import '../widgets/edit_task_date_picker_widget.dart';
import '../widgets/search_managers_bottomsheet.dart';

class EditTaskScreen extends ConsumerStatefulWidget {
  final String editTaskId;

  EditTaskScreen({required this.editTaskId, Key? key});

  @override
  ConsumerState<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends ConsumerState<EditTaskScreen> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();
  late AdminTasksModel taskDetails;

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final buttonKey = UniqueKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      taskDetails = AdminTasksModel.fromJson(jsonDecode(widget.editTaskId));
      taskTitleController.text = taskDetails.title ?? "";
      taskDetailsController.text = taskDetails.description ?? "";
      ref.read(editTaskControllerProvider.notifier).setData(
            selectedPriority: (taskDetails.priorityId),
            taskTitle: taskDetails.title,
            comments: taskDetails.comments,
            taskId: taskDetails.id,
            selectedAssigne: taskDetails.user,
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
    final controller = ref.read(editTaskControllerProvider.notifier);
    final controllerWatcher = ref.watch(editTaskControllerProvider);

    return Scaffold(
        appBar: editTaskAppBar(controller, buttonKey, formKey,
            taskTitleController.text, taskDetailsController.text),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: AppSizes.size10.h),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextInputField(
                  label: S().edit_task_title,
                  maxLength: 40,
                  controller: taskTitleController,
                  textInputAction: TextInputAction.next,
                  validator: (value) => ValidationService.notEmptyField(value),
                ),
                AppSizes.size10.verticalSpace,
                CustomTextInputField(
                  label: S().edit_task_details,
                  assignLabelWithHint: true,
                  controller: taskDetailsController,
                  textInputAction: TextInputAction.newline,
                  type: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) => ValidationService.notEmptyField(value),
                ),
                AppSizes.size10.verticalSpace,
                EditTaskDatePickerWidget(),
                AppSizes.size10.verticalSpace,
                customDropDown(
                  widget: controller.buildSvgPicture(
                      priorityIdMapper(controllerWatcher.selectedPriority)),
                  title: controllerWatcher.selectedPriority == null
                      ? S().priority
                      : priorityIdMapper(controllerWatcher.selectedPriority),
                  function: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => EditPriorityWidget());
                  },
                ),
                AppSizes.size10.verticalSpace,
                customDropDown(
                  title: controllerWatcher.statusId == null
                      ? S().status
                      : statusIdMapper(controllerWatcher.statusId),
                  function: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => EditStatusWidget());
                  },
                ),
                AppSizes.size10.verticalSpace,
                customDropDown(
                    title: controllerWatcher.selectedAssigne?.userName ??
                        S().assignee_to,
                    widget: controllerWatcher.selectedAssigne?.imageName == null
                        ? const SizedBox.shrink()
                        : Container(
                            width: 40.h,
                            height: 40.h,
                            padding: EdgeInsets.all(1.h),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  AppColors.colors.background.withOpacity(0.5),
                            ),
                            child: ClipOval(
                              child: AppCachedNetworkImage(controllerWatcher
                                          .selectedAssigne?.imageName ==
                                      null
                                  ? AppConstants.userAvatar
                                  : "${AppConstants.subDomain}${controllerWatcher.selectedAssigne?.imageName}"),
                            ),
                          ),
                    function: () {
                      adminEditManagers(context, ref);
                    }),
                AppSizes.size10.verticalSpace,
                AdminEditSubTask(),
              ],
            ),
          ).defaultScreenPadding,
        ),
        bottomNavigationBar: Consumer(
          builder: (_, ref, __) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: AppDefaultButton(
                borderRadius: 2,
                key: buttonKey,
                height: AppSizes.size50.h,
                text: S().edit,
                textColor: ColorSystemLight().scaffold,
                backgroundColor: AppColors.colors.darkBlue,
                onPressed: () {
                  controller.setData(isSave: true);
                  if (formKey.currentState!.validate()) {
                    controller.editTask(
                      title: taskTitleController.text,
                      description: taskDetailsController.text,
                      key: buttonKey,
                    );
                  }
                },
              ),
            );
          },
        ));
  }
}
