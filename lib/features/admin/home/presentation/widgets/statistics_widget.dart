import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/sizes_manager.dart';
import 'chart_widget.dart';

class StatisticsWidget extends ConsumerWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(3),
      height: 200.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.blue.withOpacity(.15),
              spreadRadius: 3,
              blurRadius: .5)
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Color(0xff14BBD8), radius: 6),
                  SizedBox(width: 8),
                  Text(S().neww),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Color(0xffFA942F), radius: 6),
                    SizedBox(width: 8),
                    Text(S().in_progress),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                      backgroundColor: AppColors.colors.green, radius: 6),
                  SizedBox(width: 8),
                  Text(S().completed),
                ],
              ),
            ],
          ),
          AppSizes.size80.horizontalSpace,
          Flexible(child: ChartWidget())
        ],
      ),
    );
  }
}
