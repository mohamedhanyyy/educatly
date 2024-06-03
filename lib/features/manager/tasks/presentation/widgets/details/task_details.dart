import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../home/presentation/widgets/tasks/department_tag.dart';
import '../../../../home/presentation/widgets/tasks/priority_widget.dart';
import '../../../../home/presentation/widgets/tasks/progress_count.dart';

class TaskDetailsWidget extends StatelessWidget {
  final String title;
  final int priority;
  final String statusId;
  final double progressCount;

  const TaskDetailsWidget({
    super.key,
    required this.title,
    required this.statusId,
    required this.priority,
    required this.progressCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: StylesManager.bold(
                      fontSize: AppFonts.font.xXLarge.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    DepartmentTagWidget(tag: statusId),
                    AppSizes.size10.horizontalSpace,
                    PriorityWidget(priority: priority),
                  ],
                ),
              ],
            ),
          ),
          ProgressCountDetailsWidget(size: 75, progress: progressCount)
        ],
      ),
    );
  }
}
