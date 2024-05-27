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
import '../../../tasks/data/model/admin_tasks_model.dart';
import '../controller/edit_task_controller.dart';

class AdminEditComment extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.read(editTaskControllerProvider.notifier);
    return Column(
      children: [
        InkWell(
          onTap: () {
            ref
                .read(editTaskControllerProvider.notifier)
                .setData(isEditComment: true);
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
                Text(S().add_comment,
                    style: StylesManager.medium(
                        color: ColorSystemLight().black2,
                        fontSize: AppSizes.size16))
              ],
            ),
          ),
        ),
        if (ref.watch(editTaskControllerProvider).comments?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
                children:
                    ref.watch(editTaskControllerProvider).comments!.map((e) {
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
                    child: Icon(Icons.task_alt),
                  ),
                  suffix: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.delete, color: AppColors.colors.primary),
                      onPressed: () {
                        ref
                            .read(editTaskControllerProvider.notifier)
                            .removeComment(comment: e);
                      }),
                  controller: TextEditingController(text: e.description),
                  textInputAction: TextInputAction.done,
                  validator: (value) => ValidationService.notEmptyField(value),
                  onSubmitted: (value) {
                    ref.watch(editTaskControllerProvider).comments!.map((e) {
                      if (e == value) return;
                    }).toList();
                    reader.removeComment(comment: e);
                    reader.setComment(comment: e);
                    reader.setData(isEditComment: false);
                  },
                ).marginZero,
              );
            }).toList()),
          ),
        if (ref.watch(editTaskControllerProvider).isEditComment == true)
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
              label: S().comment,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                if (value != '')
                  reader.setComment(comment: Comments(description: value));
                reader.setData(isEditComment: false);
              },
            ),
          ),
        AppSizes.size16.verticalSpace,
      ],
    );
  }
}
