import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/admin/home/presentation/widgets/no_tasks_widget.dart';

import '../../../../../../core/widgets/refresh_widget.dart';
import '../../controller/dashboard_controller.dart';
import 'task_widget.dart';

class ManagerTasksListWidget extends ConsumerWidget {
  const ManagerTasksListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(dashboardControllerProvider).when(
          loading: () => const CustomLoadingWidget(),
          error: (error, stackTrace) => RefreshWidget(
              onTap: () async =>
                  await ref.refresh(dashboardControllerProvider)),
          data: (tasks) {
            return tasks.isEmpty
                ? const NoTasksWidget()
                : AnimationList(
                    duration: 1250,
                    reBounceDepth: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: tasks
                        .map((e) => ManagerTaskWidget(taskDetails: e))
                        .toList(),
                  );
          },
        );
  }
}
