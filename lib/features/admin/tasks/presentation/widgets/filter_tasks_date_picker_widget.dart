import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/admin_tasks_filter_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/helpers/toast_helper.dart';

export 'package:flutter_svg/svg.dart';

class FilterTasksDatePickerWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<FilterTasksDatePickerWidget> createState() =>
      _FilterTasksDatePickerWidgetState();
}

class _FilterTasksDatePickerWidgetState
    extends ConsumerState<FilterTasksDatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final filterReader = ref.read(adminTasksFilterControllerProvider.notifier);
    final filterWatcher = ref.watch(adminTasksFilterControllerProvider);

    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () async {
              final DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.utc(2024, 5, 1),
                lastDate: DateTime.now().add(Duration(days: 30)),
              );
              if (selectedDate == null) return;

              final TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(selectedDate),
              );

              if (selectedTime == null) return;

              filterReader.setData(
                  startDate: DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 50.h,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorSystemLight().black2, width: .7),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filterReader.getFormattedStartDate(),
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: filterWatcher.startDate == null
                            ? ColorSystemLight().black2
                            : ColorSystemLight().black),
                  ),
                  SvgPicture.asset(Assets.icons.pickDate)
                ],
              ),
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
                lastDate: DateTime.now().add(Duration(days: 100)),
              );
              if (endDate == null) return;
              final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(endDate));

              if (selectedTime == null) return;
              if (filterWatcher.startDate == null) {
                Toast.showErrorToast(S().select_first_date);
                return;
              }

              if (!endDate.isAfter(filterWatcher.startDate!)) {
                Toast.showErrorToast(S().end_date_must_be_after_start_date);
                return;
              }

              filterReader.setData(
                  endDate: DateTime(
                endDate.year,
                endDate.month,
                endDate.day,
                selectedTime.hour,
                selectedTime.minute,
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 50.h,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorSystemLight().black2, width: .7),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filterReader.getFormattedEndDate(),
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: filterWatcher.startDate == null
                            ? ColorSystemLight().black2
                            : ColorSystemLight().black),
                  ),
                  SvgPicture.asset(Assets.icons.pickDate)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
