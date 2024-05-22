import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/features/manager/stats/stats_model.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import 'statistics_widget.dart';

class ManagerStatisticsWidget extends ConsumerWidget {
  const ManagerStatisticsWidget({super.key, required this.statsData});

  final StatsData statsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView(
        children: [
          SingleStatisticsWidget(
            count: statsData.taskAllCount ?? 0,
            title: S().all_tasks,
            color: Colors.red,
            iconPath: 'assets/icons/all.svg',
          ),
          SingleStatisticsWidget(
            count: statsData.taskCompleteCount ?? 0,
            title: S().completed,
            iconPath: 'assets/icons/done.svg',
            color: Color(0xff01DF85),
          ),
          SingleStatisticsWidget(
            count: statsData.taskInProgressCount ?? 0,
            title: S().in_progress,
            color: Color(0xffFA942F),
            iconPath: 'assets/icons/progress.svg',
          ),
          SingleStatisticsWidget(
            count: statsData.taskNewCount ?? 0,
            title: S().neww,
            color: Color(0xff14BBD8),
            iconPath: "assets/icons/next.svg",
          ),
        ],
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100.h,
          mainAxisSpacing: AppSizes.size10.h,
          crossAxisSpacing: AppSizes.size10.w,
        ),
      ),
    );
  }
}
