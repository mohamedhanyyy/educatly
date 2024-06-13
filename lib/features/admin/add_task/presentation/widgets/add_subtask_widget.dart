import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controller/add_task_controller.dart';

final TextEditingController controller = TextEditingController();

class AdminAddSubTask extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watcher = ref.watch(addTaskControllerProvider);
    final reader = ref.read(addTaskControllerProvider.notifier);
    return Column(
      children: [
        if (watcher.tasks?.isNotEmpty == true)
          Column(
              mainAxisSize: MainAxisSize.min,
              children: watcher.tasks!.map((e) {
                // TextEditingController cont = TextEditingController(text: e);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: AppSizes.size5.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).disabledColor),
                  ),
                  child: CustomTextInputField(
                    label: null,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    prefix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.task_alt_outlined,
                          color: AppColors.colors.primary),
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.colors.error.withOpacity(.1),
                        child: GestureDetector(
                          onTap: () {
                            reader.removeTask(task: e);
                          },
                          child: Icon(Icons.clear, color: Colors.red),
                        ),
                      ),
                    ),
                    controller: TextEditingController(text: e),
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        ValidationService.subTaskValidator(value),
                    onSubmitted: (value) {
                      reader.removeTask(task: e);
                      reader.setTask(task: value!);
                      reader.setData(isAddTask: false);
                    },
                  ),
                );
              }).toList()),
        // if (watcher.isAddTask == true)
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.size2.w),
          margin: EdgeInsets.only(top: AppSizes.size4.h),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Theme.of(context).scaffoldBackgroundColor)),
          child: CustomTextInputField(
            errorText: '',
            controller: controller,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
              child: SvgPicture.asset(Assets.icons.addTask),
            ),
            label: S().add_subtask,
            textInputAction: TextInputAction.next,
            onSubmitted: (value) {
              if (watcher.tasks?.contains(value) == true) {
                Toast.showToast(S().task_already_added);
                return;
              }
              if (value != '') reader.setTask(task: value!);
              reader.setData(isAddTask: false);
              controller.clear();
            },
          ),
        ),
        AppSizes.size6.verticalSpace,
      ],
    );
  }
}
