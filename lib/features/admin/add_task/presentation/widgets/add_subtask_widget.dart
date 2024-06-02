import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/extensions/context_extension.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/sizes_manager.dart';
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
                    // maxLines: null,
                    // type: TextInputType.multiline,
                    // textInputAction: TextInputAction.newline,
                    autoFocus: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    prefix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.task_alt_outlined,
                          color: AppColors.colors.primary),
                    ),
                    suffix: IconButton(
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset(
                          'assets/icons/taskDelete.svg',
                          colorFilter: Colors.red.toColorFilter,
                        ),
                        onPressed: () {
                          reader.removeTask(task: e);
                        }),
                    controller: TextEditingController(text: e),
                    validator: (value) =>
                        ValidationService.subTaskValidator(value),
                    onSubmitted: (value) {
                      reader.removeTask(task: e);
                      reader.setTask(task: value!);
                    },
                  ),
                );
              }).toList()),
        Container(
          margin: EdgeInsets.only(top: AppSizes.size4.h),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Theme.of(context).scaffoldBackgroundColor)),
          child: CustomTextInputField(
            controller: controller,
            suffix: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 15,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.done),
                  onPressed: () {
                    if (watcher.tasks?.contains(controller.text) == true) {
                      Toast.showToast(S().task_already_added);
                      return;
                    }
                    if (controller.text != '')
                      reader.setTask(task: controller.text);
                  },
                ),
              ),
            ),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            maxLines: null,
            type: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
              child: SvgPicture.asset(Assets.icons.addTask),
            ),
            label: S().sub_task_details,
          ),
        ),
        AppSizes.size6.verticalSpace,
      ],
    );
  }
}
