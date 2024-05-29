import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/manager/home/presentation/controller/all_tasks/manager_all_tasks.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
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
                    await ref.refresh(managerAllTasksControllerProvider),
              ),
              data: (data) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => AppSizes.size16.verticalSpace,
                    itemBuilder: (_, index) =>
                        TaskWidget(taskDetails: data[index]));
              },
            ));
  }
}
