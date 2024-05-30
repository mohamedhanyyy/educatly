import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/extensions/string.dart';

import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/controllers/theme/theme_controller.dart';
import '../../controller/calender_controller.dart';
import 'calender_day.dart';

class CalenderMonthWidget extends ConsumerWidget {
  final FixedExtentScrollController _controller;

  const CalenderMonthWidget(
      {super.key, required FixedExtentScrollController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _dateTime = ref.watch(calenderControllerProvider).currentMonth;
    return Container(
      height: 100.h,
      decoration: AppConstants.defaultBoxDecoration.copyWith(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            if (ref.watch(themeControllerProvider) == ThemeMode.light)
              BoxShadow(
                  blurRadius: 4, spreadRadius: 5, color: Colors.grey.shade200)
          ]),
      padding: EdgeInsetsDirectional.symmetric(vertical: AppSizes.size10.h),
      child: RotatedBox(
        quarterTurns: -1,
        child: DecoratedBox(
          decoration:
              BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: ListWheelScrollView(
            itemExtent: 65.w,
            offAxisFraction: 0,
            perspective: 0.004,
            controller: _controller,
            physics: const FixedExtentScrollPhysics(),
            children: List.generate(_dateTime.getDaysCount, (index) {
              final _date =
                  DateTime(_dateTime.year, _dateTime.month, index + 1);
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.size4.w),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: CalenderDayWidget(
                      dateTime: _date, controller: _controller),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
