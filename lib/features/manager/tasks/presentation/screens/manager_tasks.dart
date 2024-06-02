import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/manager/home/presentation/controller/all_tasks/manager_all_tasks.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../core/widgets/refresh_widget.dart';
import '../../../home/presentation/widgets/tasks/task_widget.dart';

class ManagerTasksScreen extends ConsumerStatefulWidget {
  const ManagerTasksScreen({super.key});

  @override
  ConsumerState<ManagerTasksScreen> createState() => _ManagerTasksScreenState();
}

class _ManagerTasksScreenState extends ConsumerState<ManagerTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S().all_tasks)),
        body: ref.watch(managerAllTasksControllerProvider).when(
            loading: () => CustomLoadingWidget(0),
            error: (error, stackTrace) => RefreshWidget(
                onTap: () async =>
                    await ref.refresh(managerAllTasksControllerProvider)),
            data: (tasks) {
              return AnimationList(
                  duration: 1250,
                  reBounceDepth: 10,
                  shrinkWrap: true,
                  children: tasks
                      .map((e) => ManagerTaskWidget(taskDetails: e))
                      .toList());
            }));
  }
}
