import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';

import '../../../stats/bloc/manager_statistics_bloc.dart';
import '../controller/calender_controller.dart';
import '../widgets/calender/calender_widget.dart';
import '../widgets/filters/filters_list.dart';
import '../widgets/home_appbar.dart';
import '../widgets/statistics/statistics_list.dart';
import '../widgets/tasks/tasks_list.dart';

class ManagerMainScreen extends ConsumerStatefulWidget {
  const ManagerMainScreen({super.key});

  @override
  ConsumerState<ManagerMainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<ManagerMainScreen> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  late ManagerStatisticsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ManagerStatisticsCubit>();
    cubit.getManagerStatistics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(calenderControllerProvider.notifier)
          .animateToSelectedDate(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HomeAppbar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ManagerStatisticsCubit, CubitState>(
                builder: (BuildContext _, state) {
              if (state == CubitState.done) {
                return ManagerStatisticsWidget(
                    statsData: cubit.statisticsModel!.statsData!);
              } else if (state == CubitState.loading)
                return CustomLoadingWidget();

              return const SizedBox.shrink();
            }),
            AppSizes.size20.verticalSpace,
            CalenderWidget(controller: _controller),
            AppSizes.size10.verticalSpace,
            FiltersListWidget(controller: _controller),
            AppSizes.size20.verticalSpace,
            TasksListWidget()
          ],
        ).defaultScreenPadding,
      ),
    );
  }
}
