import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../controller/calender_controller.dart';
import '../../controller/dashboard_controller.dart';

class CalenderDayWidget extends ConsumerWidget {
  final DateTime _dateTime;
  final FixedExtentScrollController _controller;

  const CalenderDayWidget({
    super.key,
    required DateTime dateTime,
    required FixedExtentScrollController controller,
  })  : _controller = controller,
        _dateTime = dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isSelected =
        _dateTime == ref.watch(calenderControllerProvider).selectedDate;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: ref.watch(dashboardControllerProvider).isLoading
          ? null
          : () => ref
              .read(calenderControllerProvider.notifier)
              .selectFullDate(_dateTime, _controller),
      child: Container(
        width: 55.w,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.size4.w),
        decoration: BoxDecoration(
          color: _isSelected
              ? AppColors.colors.primary
              : Theme.of(context).listTileTheme.tileColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(flex: 2),
            Text(
              DateFormat('dd').format(_dateTime),
              style: _isSelected
                  ? StylesManager.bold(
                      fontSize: AppFonts.font.xXLarge.sp,
                      color: Theme.of(context).scaffoldBackgroundColor)
                  : StylesManager.medium(fontSize: AppFonts.font.xXLarge.sp),
            ),
            Spacer(),
            FittedBox(
              child: Text(
                DateFormat('EEE').format(_dateTime),
                style: _isSelected
                    ? StylesManager.bold(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: AppFonts.font.medium.sp,
                        textOverflow: TextOverflow.ellipsis,
                      )
                    : StylesManager.medium(
                        fontSize: AppFonts.font.medium.sp,
                        textOverflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
