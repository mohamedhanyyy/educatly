import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/styles_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../controller/add_task_controller.dart';

export 'package:flutter_svg/svg.dart';

class AddTaskDatePickerWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watcher = ref.watch(addTaskControllerProvider);
    return Padding(
      padding: EdgeInsets.only(
          bottom: (watcher.startDate == null || watcher.endDate == null) &&
                  watcher.isSaveClick == true
              ? 10
              : 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 30)),
                );
                if (selectedDate == null) return;

                final TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(selectedDate),
                );

                if (selectedTime == null) return;
                ref.read(addTaskControllerProvider.notifier).setData(
                        startDate: DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: AppSizes.size50.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorSystemLight().black2, width: .7),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${ref.read(addTaskControllerProvider.notifier).getFormattedStartDate()}',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: watcher.startDate == null
                                  ? ColorSystemLight().black2
                                  : ColorSystemLight().black),
                        ),
                        SvgPicture.asset(Assets.icons.pickDate)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                        watcher.startDate == null && watcher.isSaveClick == true
                            ? S().start_date
                            : '',
                        style: StylesManager.error()),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: AppSizes.size10.w),
          Flexible(
            child: GestureDetector(
              onTap: () async {
                final endDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 100)),
                );
                if (endDate == null) return;
                final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(endDate));

                if (selectedTime == null) return;
                if (watcher.startDate == null) {
                  Toast.showErrorToast(S().select_first_date);
                  return;
                }

                if (watcher.startDate?.day == endDate.day &&
                    selectedTime.hour - watcher.startDate!.hour < 3) {
                  Toast.showErrorToast(
                      S().duration_must_be_at_least_three_hours);
                  return;
                } else if (!endDate.isAfter(watcher.startDate!) &&
                    watcher.startDate?.day != endDate.day) {
                  Toast.showErrorToast(S().end_date_must_be_after_start_date);
                  return;
                }

                ref.read(addTaskControllerProvider.notifier).setData(
                        endDate: DateTime(
                      endDate.year,
                      endDate.month,
                      endDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 50.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorSystemLight().black2, width: .7),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${ref.read(addTaskControllerProvider.notifier).getFormattedEndDate()}',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: watcher.startDate == null
                                  ? ColorSystemLight().black2
                                  : ColorSystemLight().black),
                        ),
                        SvgPicture.asset(Assets.icons.pickDate)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                        watcher.endDate == null && watcher.isSaveClick == true
                            ? S().end_date
                            : '',
                        style: StylesManager.error()),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
