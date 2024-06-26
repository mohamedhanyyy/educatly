import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controller/edit_task_controller.dart';

export 'package:flutter_svg/svg.dart';

class EditTaskDatePickerWidget extends ConsumerWidget {
  const EditTaskDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watcher = ref.watch(editTaskControllerProvider);

    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () async {
              final DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
              );
              if (selectedDate == null) return;

              final TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(selectedDate),
              );

              if (selectedTime == null) return;
              ref.read(editTaskControllerProvider.notifier).setData(
                      startDate: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  ));
            },
            child: CustomTextInputField(
              enabled: false,
              labelColor: watcher.startDate == null
                  ? ColorSystemLight().black2
                  : ColorSystemLight().black,
              label:
                  '${ref.read(editTaskControllerProvider.notifier).getFormattedStartDate()}',
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(Assets.icons.pickDate),
              ),
              validator: (value) {
                return ValidationService.notEmptyField(
                    watcher.startDate == null ? null : 'unique');
              },
            ),
          ),
        ),
        SizedBox(width: AppSizes.size10.w),
        Flexible(
          child: GestureDetector(
            onTap: () async {
              final DateTime? endDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
              );

              if (endDate == null) return;

              final TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(endDate),
              );

              if (selectedTime == null) return;

              if (watcher.startDate != null &&
                  endDate.isAfter(watcher.startDate!)) {
                ref.read(editTaskControllerProvider.notifier).setData(
                        endDate: DateTime(
                      endDate.year,
                      endDate.month,
                      endDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    ));
              } else {
                Toast.showToast(S().end_date_must_be_after_start_date);
              }
            },
            child: CustomTextInputField(
              labelColor: watcher.startDate == null
                  ? ColorSystemLight().black2
                  : ColorSystemLight().black,
              enabled: false,
              label:
                  '${ref.read(editTaskControllerProvider.notifier).getFormattedEndDate()}',
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(Assets.icons.pickDate),
              ),
              validator: (value) => ValidationService.notEmptyField(
                  watcher.endDate == null ? null : ' uniquee'),
            ),
          ),
        ),
      ],
    );
  }
}
