import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/iterator_extension.dart';
import 'package:taskaty/core/helpers/mappers.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/core/widgets/app_button.dart';
import 'package:taskaty/features/admin/add_task/data/model/add_task_response.dart';
import 'package:taskaty/features/manager/home/presentation/controller/all_tasks/manager_all_tasks.dart';
import 'package:taskaty/features/manager/home/presentation/controller/dashboard_controller.dart';
import 'package:taskaty/features/manager/home/presentation/controller/filters_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../../admin/tasks/data/model/admin_tasks_model.dart';
import '../../../stats/bloc/manager_statistics_bloc.dart';
import '../widgets/description/description_widget.dart';
import '../widgets/details/task_details.dart';
import '../widgets/info/task_info.dart';
import '../widgets/task_headline.dart';

class ManagerTaskDetailsScreen extends ConsumerStatefulWidget {
  final String managerTaskDetails;
  final buttonKey = UniqueKey();

  ManagerTaskDetailsScreen({super.key, required this.managerTaskDetails});

  @override
  ConsumerState<ManagerTaskDetailsScreen> createState() =>
      _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends ConsumerState<ManagerTaskDetailsScreen> {
  List<bool> selected = [];
  double progress = 0;
  late AdminTasksModel taskDetails;
  @override
  void initState() {
    super.initState();
    taskDetails =
        AdminTasksModel.fromJson(jsonDecode(widget.managerTaskDetails));
    taskDetails.subTasks!.forEach((e) {
      selected.add(e.isCompleted!);
      if (e.isCompleted!) progress++;
    });
    progress = (progress / selected.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().task_details)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TaskDetailsWidget(
                    title: '${taskDetails.title}',
                    priority: taskDetails.priorityId!,
                    statusId: statusIdMapper(taskDetails.statusId),
                    progressCount: progress,
                    departmentTag: '${taskDetails.description}',
                  ),
                  TaskInfoWidget(
                    userName: '${taskDetails.userName}',
                    userImage: 'taskDetails',
                    endDate: DateTime.parse(taskDetails.endDate!),
                    startDate: DateTime.parse(taskDetails.startDate!),
                  ),
                  DescriptionWidget(description: '${taskDetails.description}'),
                  TaskHeadLineWidget(
                    title: S().subtasks,
                    icon: Assets.icons.subtasks,
                  ),
                  if (taskDetails.subTasks!.isNotEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: taskDetails.subTasks!.map((e) {
                        bool status =
                            selected[taskDetails.subTasks!.indexOf(e)];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            minTileHeight: 48,
                            selectedColor:
                                Theme.of(context).secondaryHeaderColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    width: 1,
                                    color: Colors.lightBlue.shade100)),
                            leading: IconButton(
                              iconSize: status ? 25 : 20,
                              icon: Icon(status
                                  ? Icons.task_alt_outlined
                                  : Icons.check_circle_outline),
                              color: status
                                  ? AppColors.colors.green
                                  : Theme.of(context).secondaryHeaderColor,
                              onPressed: () {
                                selected[taskDetails.subTasks!.indexOf(e)] =
                                    !selected[taskDetails.subTasks!.indexOf(e)];
                                setState(() {});
                              },
                            ),
                            onTap: () {
                              selected[taskDetails.subTasks!.indexOf(e)] =
                                  !status;
                              setState(() {});
                            },
                            title: Text(
                              '${e.description}',
                              selectionColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              style: TextStyle(
                                  decoration: status
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            selected: status,
                          ),
                        );
                      }).toList(),
                    ),
                ].addSeparator(child: AppSizes.size20.verticalSpace).toList(),
              ).paddingSymmetric(
                vertical: AppSizes.size20.h,
                horizontal: AppSizes.size10.w,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        child: AppDefaultButton(
          key: widget.buttonKey,
          onPressed: () async {
            ref
                .read(buttonControllerProvider.notifier)
                .setLoadingStatus(widget.buttonKey);

            final subTasksLength = taskDetails.subTasks!.length;
            final selectedLength = selected.length;

            final commonLength = min(subTasksLength, selectedLength);

            List<SubTasks> list = [];
            for (int i = 0; i < commonLength; i++) {
              list.add(SubTasks(
                  isCompleted: selected[i], id: taskDetails.subTasks![i].id));
            }
            Response? response = await DioHelper.putData(
                url: Api.updateSubTask, data: list.map((e) => e).toList());
            if (response?.statusCode == 200) {
              ref
                  .read(buttonControllerProvider.notifier)
                  .setSuccessStatus(widget.buttonKey);
              ref.invalidate(managerAllTasksControllerProvider);
              ref.invalidate(filtersControllerProvider);
              ref.invalidate(dashboardControllerProvider);
              context.read<ManagerStatisticsCubit>().getManagerStatistics();
              AppRouter.router.pop();
            } else {
              ref
                  .read(buttonControllerProvider.notifier)
                  .setErrorStatus(widget.buttonKey);
            }
          },
          child: Text(
            S().save,
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
