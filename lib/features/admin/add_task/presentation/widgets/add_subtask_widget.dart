import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controller/add_task_controller.dart';

class AdminAddSubTask extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watcher = ref.watch(addTaskControllerProvider);
    final reader = ref.read(addTaskControllerProvider.notifier);
    return Column(
      children: [
        InkWell(
          onTap: () {
            reader.setData(isAddTask: true);
          },
          child: Container(
            padding: EdgeInsets.all(AppSizes.size10.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: Theme.of(context).hintColor.withOpacity(.12))),
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
        AppSizes.size5.verticalSpace,
        if (watcher.tasks?.isNotEmpty == true)
          Column(
              mainAxisSize: MainAxisSize.min,
              children: watcher.tasks!.map((e) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: AppSizes.size5.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).disabledColor),
                  ),
                  child: CustomTextInputField(
                    label: null,
                    autoFocus: true,
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
                          child: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
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
        if (watcher.isAddTask == true)
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.size2.w),
            margin: EdgeInsets.only(top: AppSizes.size4.h),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor)),
            child: CustomTextInputField(
              errorText: '',
              controller: controller,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              autoFocus: true,
              prefix: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
                child: SvgPicture.asset(Assets.icons.addTask),
              ),
              label: S().sub_task_details,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                if (watcher.tasks?.contains(value) == true) {
                  Toast.showToast(S().task_already_added);
                  return;
                }
                if (value != '') reader.setTask(task: value!);
                reader.setData(isAddTask: false);
              },
            ),
          ),
        AppSizes.size6.verticalSpace,
      ],
    );
  }
}
