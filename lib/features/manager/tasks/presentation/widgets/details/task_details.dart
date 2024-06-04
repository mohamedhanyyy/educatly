import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../home/presentation/widgets/tasks/department_tag.dart';
import '../../../../home/presentation/widgets/tasks/priority_widget.dart';
import '../../../../home/presentation/widgets/tasks/progress_count.dart';

class TaskDetailsWidget extends StatefulWidget {
  final String title;
  final int priorityId;
  final int statusId;
  final double progress;

  const TaskDetailsWidget({
    super.key,
    required this.title,
    required this.statusId,
    required this.priorityId,
    required this.progress,
  });

  @override
  State<TaskDetailsWidget> createState() => _TaskDetailsWidgetState();
}

class _TaskDetailsWidgetState extends State<TaskDetailsWidget> {
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
                    '${widget.title}',
                    style:
                        StylesManager.bold(fontSize: AppFonts.font.xXLarge.sp),
                  ),
                ),
                Row(
                  children: [
                    StatusWidget(statusId: widget.statusId),
                    AppSizes.size10.horizontalSpace,
                    PriorityWidget(priority: widget.priorityId),
                  ],
                ),
              ],
            ),
          ),
          ProgressCountDetailsWidget(size: 75, progress: widget.progress)
        ],
      ),
    );
  }
}
