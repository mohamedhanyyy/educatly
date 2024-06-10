import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/extensions/priority.dart';
import '../../../../../core/helpers/mappers.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/network_image.dart';
import '../controller/add_task_controller.dart';
import '../widgets/add_subtask_widget.dart';
import '../widgets/add_task_comment_widget.dart';
import '../widgets/add_task_date_picker_widget.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/priority_bottom_sheet.dart';
import '../widgets/search_managers.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final buttonKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    final reader = ref.read(addTaskControllerProvider.notifier);
    final watcher = ref.watch(addTaskControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(S().add_new_task)),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: AppSizes.size10.h, bottom: AppSizes.size10.h),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextInputField(
                label: S().task_title,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/taskDesc.svg',
                    width: 20,
                    height: 20,
                    colorFilter:
                        Theme.of(context).unselectedWidgetColor.toColorFilter,
                  ),
                ),
                maxLength: 40,
                controller: taskTitleController,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return ValidationService.taskTitleValidator(value);
                },
              ),
              AppSizes.size10.verticalSpace,
              CustomTextInputField(
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    'assets/icons/taskDesc.svg',
                    width: 20,
                    height: 20,
                    colorFilter:
                        Theme.of(context).unselectedWidgetColor.toColorFilter,
                  ),
                ),
                label: S().task_details,
                controller: taskDetailsController,
                textInputAction: TextInputAction.newline,
                type: TextInputType.multiline,
                maxLines: null,
                validator: (value) => ValidationService.notEmptyField(value),
              ),
              AppSizes.size15.verticalSpace,
              AddTaskDatePickerWidget(),
              customDropDown(
                widget: priorityIconMapper(watcher.priorityId),
                textColor: watcher.priorityId != null
                    ? Theme.of(context).secondaryHeaderColor
                    : Theme.of(context).hintColor,
                title: watcher.priorityId == null
                    ? S().priority
                    : priorityIdMapper(watcher.priorityId),
                function: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => AdminAddTaskPriority());
                },
              ),
              if (watcher.priorityId == null && watcher.isSaveClick == true)
                Padding(
                  padding: EdgeInsets.only(
                      bottom: AppSizes.size5.h, top: AppSizes.size8.h),
                  child: Text(S().select_priority,
                      style: StylesManager.regular(
                          color: AppColors.colors.error,
                          fontSize: AppSizes.size12.sp)),
                ),
              AppSizes.size10.verticalSpace,
              customDropDown(
                  textColor: watcher.selectedManager != null
                      ? Theme.of(context).secondaryHeaderColor
                      : Theme.of(context).hintColor,
                  title: watcher.selectedManager?.userName ?? S().manager_name,
                  widget: watcher.selectedManager == null
                      ? const SizedBox.shrink()
                      : Container(
                          width: 40.h,
                          height: 40.h,
                          padding: EdgeInsets.all(1.h),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colors.background.withOpacity(0.5),
                          ),
                          child: ClipOval(
                            child: AppCachedNetworkImage(
                                "${AppConstants.subDomain}${watcher.selectedManager?.imageName}"),
                          ),
                        ),
                  function: () {
                    searchManagers(context, ref);
                  }),
              if (watcher.selectedManager == null &&
                  watcher.isSaveClick == true)
                Padding(
                  padding: EdgeInsets.only(
                      bottom: AppSizes.size5.h, top: AppSizes.size8.h),
                  child: Text(S().select_assignee,
                      style: StylesManager.regular(
                          color: AppColors.colors.error,
                          fontSize: AppSizes.size12.sp)),
                ),
              AppSizes.size10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.size4.h),
                child: Text(
                  S().adding_subtask,
                  style: StylesManager.semiBold(fontSize: AppSizes.size12),
                ),
              ),
              AdminAddSubTask(),
              AddTaskCommentsWidget(),
            ],
          ),
        ).defaultScreenPadding,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: AppDefaultButton(
          key: buttonKey,
          text: S().save,
          textColor: ColorSystemLight().scaffold,
          backgroundColor: AppColors.colors.darkBlue,
          onPressed: () {
            reader.setData(isSave: true);
            if (formKey.currentState!.validate()) {
              reader.addTask(
                title: taskTitleController.text,
                description: taskDetailsController.text,
                key: buttonKey,
              );
            }
          },
        ),
      ),
    );
  }
}
