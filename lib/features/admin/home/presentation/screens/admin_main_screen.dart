import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/admin/home/presentation/widgets/admin_home_search_widget.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/get_admin_tasks_controller.dart';

import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/widgets/refresh_widget.dart';
import '../widgets/admin_home_appbar.dart';
import '../widgets/admin_home_filter.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/no_tasks_widget.dart';
import '../widgets/statistics_widget.dart';
import '../widgets/task_item_widget.dart';

class AdminMainScreen extends ConsumerWidget {
  AdminMainScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppSizes.size80.h),
        child: AdminHomeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdminStatisticsWidget(),
            AdminHomeFilterWidget(),
            AdminHomeSearchWidget(),
            ref.watch(getAdminTasksControllerProvider).when(
                  loading: () => CustomLoadingWidget(50.h),
                  error: (error, stackTrace) => RefreshWidget(
                      onTap: () async =>
                          await ref.refresh(getAdminTasksControllerProvider)),
                  data: (tasks) {
                    return tasks.isEmpty
                        ? NoTasksWidget()
                        : AnimationList(
                            duration: 1250,
                            reBounceDepth: 0,
                            children: tasks
                                .map((e) => TaskItemWidget(task: e))
                                .toList(),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                          );
                  },
                )
          ],
        ),
      ).defaultScreenPadding,
    );
  }
}
