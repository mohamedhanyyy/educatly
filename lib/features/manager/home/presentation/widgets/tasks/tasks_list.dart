import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../core/widgets/refresh_widget.dart';
import '../../controller/dashboard_controller.dart';
import 'task_widget.dart';

class TasksListWidget extends ConsumerWidget {
  const TasksListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(dashboardControllerProvider).when(
          loading: () => Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          error: (error, stackTrace) => RefreshWidget(
            onTap: () async => await ref.refresh(dashboardControllerProvider),
          ),
          data: (data) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: data.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => AppSizes.size16.verticalSpace,
              itemBuilder: (_, index) => TaskWidget(taskDetails: data[index]),
            );
          },
        );
  }
}
