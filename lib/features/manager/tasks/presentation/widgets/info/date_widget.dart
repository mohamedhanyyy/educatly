import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/config/theme/styles_manager.dart';

import '../../../../../../config/l10n/generated/l10n.dart';

enum DateType { start, end }

class DateWidget extends StatelessWidget {
  final DateTime date;
  final DateType dateType;

  const DateWidget({super.key, required this.date, required this.dateType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppSizes.size10.h,
                  height: AppSizes.size10.h,
                  child: FittedBox(
                    child: Icon(
                      Icons.access_time_rounded,
                      color: dateType == DateType.start
                          ? AppColors.colors.success
                          : AppColors.colors.error,
                    ),
                  ),
                ),
                AppSizes.size4.horizontalSpace,
                Text(dateType == DateType.start ? S().start_date : S().end_date)
              ],
            ),
            AppSizes.size4.verticalSpace,
            Text(
              DateFormat('dd-MM-yyyy \n HH : MM').format(date),
              style: StylesManager.light(
                fontSize: 11.sp,
                textOverflow: TextOverflow.ellipsis,
              ).copyWith(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}