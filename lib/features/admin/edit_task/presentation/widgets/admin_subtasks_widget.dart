import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../controller/edit_task_controller.dart';

final TextEditingController controller = TextEditingController();

class AdminEditSubTask extends ConsumerWidget {
  const AdminEditSubTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.read(editTaskControllerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.size6.w, vertical: AppSizes.size2.h),
          child: Text(S().editing_adding_subtask,
              style: StylesManager.semiBold(fontSize: AppSizes.size12)),
        ),
        if (ref.watch(editTaskControllerProvider).subTasks?.isNotEmpty == true)
          Column(
              children:
                  ref.watch(editTaskControllerProvider).subTasks!.map((e) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: AppSizes.size5.h),
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(AppSizes.size8),
                border: Border.all(color: Theme.of(context).disabledColor),
              ),
              child: CustomTextInputField(
                errorText: '',
                label: null,
                enabled: e.isCompleted == true ? false : true,
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.task_alt,
                      color: e.isCompleted == true
                          ? AppColors.colors.green
                          : Theme.of(context).secondaryHeaderColor),
                ),
                suffix: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref
                          .read(editTaskControllerProvider.notifier)
                          .removeTask(task: e);
                    }),
                controller: TextEditingController(text: e.description),
                textInputAction: TextInputAction.done,
                validator: (value) => ValidationService.notEmptyField(value),
                onSubmitted: (value) {
                  ref.watch(editTaskControllerProvider).subTasks!.map((e) {
                    if (e.description == value) return;
                  }).toList();
                  reader.removeTask(task: e);
                  reader.setTask(task: SubTasks(description: value));
                  reader.setData(isEditTask: false);
                },
              ).marginZero,
            );
          }).toList()),
        Container(
          margin: EdgeInsets.only(top: AppSizes.size4.h),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppSizes.size8),
              border:
                  Border.all(color: Theme.of(context).scaffoldBackgroundColor)),
          child: CustomTextInputField(
            suffix: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.done),
              color: AppColors.colors.primary,
              onPressed: () {
                if (controller.text != '')
                  reader.setTask(task: SubTasks(description: controller.text));
                reader.setData(isEditTask: false);
                controller.clear();
              },
            ),
            controller: controller,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
              child: SvgPicture.asset(Assets.icons.addTask),
            ),
            label: S().sub_task_details,
            textInputAction: TextInputAction.newline,
            type: TextInputType.multiline,
            maxLines: null,
          ),
        ),
        AppSizes.size16.verticalSpace,
      ],
    );
  }
}
