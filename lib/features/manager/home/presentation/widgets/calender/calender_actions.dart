import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/styles_manager.dart';

import '../../controller/calender_controller.dart';

class CalenderActions extends ConsumerWidget {
  final FixedExtentScrollController _controller;

  const CalenderActions({
    super.key,
    required FixedExtentScrollController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _date = ref.watch(calenderControllerProvider).currentMonth;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30.h),
          child: Icon(Icons.navigate_before, size: 30.h),
          onTap: () => ref
              .read(calenderControllerProvider.notifier)
              .previousMonth(_controller),
        ),
        InkWell(
          onTap: () async {
            final DateTime? _picked = await showDatePicker(
              context: context,
              initialDate: _date,
              lastDate: DateTime(2030),
              firstDate: DateTime(2020),
              currentDate: ref.watch(calenderControllerProvider).selectedDate,
            );
            if (_picked != null)
              ref
                  .read(calenderControllerProvider.notifier)
                  .selectFullDate(_picked, _controller);
          },
          child: Text(
            DateFormat('MMMM - yyyy').format(_date),
            style: StylesManager.medium(fontSize: AppFonts.font.xXLarge.sp),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(30.h),
          child: Icon(Icons.navigate_next, size: 30.h),
          onTap: () => ref
              .read(calenderControllerProvider.notifier)
              .nextMonth(_controller),
        ),
      ],
    );
  }
}
