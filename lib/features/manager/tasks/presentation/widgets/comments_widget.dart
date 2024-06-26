import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';

import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';

class ManagerCommentsWidget extends StatelessWidget {
  const ManagerCommentsWidget({super.key, required this.tasksModel});
  final AdminTasksModel tasksModel;

  @override
  Widget build(BuildContext context) {
    return tasksModel.comments?.isNotEmpty == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: tasksModel.comments!.map((e) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).highlightColor),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.icons.comments),
                    AppSizes.size10.horizontalSpace,
                    Flexible(child: Text(e.description!)),
                  ],
                ),
              );
            }).toList())
        : const SizedBox.shrink();
  }
}
