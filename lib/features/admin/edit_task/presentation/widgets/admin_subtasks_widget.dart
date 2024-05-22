import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../controller/edit_task_controller.dart';

class AdminEditSubTask extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.read(editTaskControllerProvider.notifier);
    return Column(
      children: [
        InkWell(
          onTap: () {
            ref
                .read(editTaskControllerProvider.notifier)
                .setData(isEditTask: true);
          },
          child: Container(
            padding: EdgeInsets.all(AppSizes.size10.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.size10),
                border: Border.all(color: Theme.of(context).hintColor)),
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.addTask),
                AppSizes.size8.horizontalSpace,
                Text(S().add_subtask,
                    style: StylesManager.medium(
                        color: ColorSystemLight().black2,
                        fontSize: AppSizes.size16))
              ],
            ),
          ),
        ),
        if (ref.watch(editTaskControllerProvider).subTasks?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
                children:
                    ref.watch(editTaskControllerProvider).subTasks!.map((e) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: AppSizes.size5.h),
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(AppSizes.size10),
                  border: Border.all(color: Theme.of(context).disabledColor),
                ),
                child: CustomTextInputField(
                  errorText: '',
                  label: null,
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                        Icon(Icons.task_alt, color: AppColors.colors.darkBlue),
                  ),
                  suffix: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.delete, color: AppColors.colors.primary),
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
          ),
        if (ref.watch(editTaskControllerProvider).isEditTask == true)
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.size2.w),
            margin: EdgeInsets.only(top: AppSizes.size4.h),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.size10),
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor)),
            child: CustomTextInputField(
              errorText: '',
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              autoFocus: true,
              prefix: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
                child: SvgPicture.asset(Assets.icons.addTask),
              ),
              label: S().sub_task_details,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                if (value != '')
                  reader.setTask(task: SubTasks(description: value));
                reader.setData(isEditTask: false);
              },
            ),
          ),
        AppSizes.size16.verticalSpace,
      ],
    );
  }
}
