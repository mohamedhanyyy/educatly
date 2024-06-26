import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/core/extensions/iterator_extension.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/core/widgets/app_button.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/admin/add_task/data/model/add_task_response.dart';
import 'package:taskaty/features/admin/task_details/task_details_bloc.dart';
import 'package:taskaty/features/admin/task_details/task_details_state.dart';
import 'package:taskaty/features/manager/home/presentation/controller/all_tasks/manager_all_tasks.dart';
import 'package:taskaty/features/manager/home/presentation/controller/filters_controller.dart';
import 'package:taskaty/features/manager/tasks/presentation/widgets/add_comment.dart';
import 'package:taskaty/features/manager/tasks/presentation/widgets/comments_widget.dart';
import 'package:taskaty/features/manager/tasks/presentation/widgets/sub_tasks_widget.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../home/presentation/controller/dashboard_controller.dart';
import '../../../stats/bloc/manager_statistics_bloc.dart';
import '../widgets/description/description_widget.dart';
import '../widgets/details/task_details.dart';
import '../widgets/info/task_info.dart';
import '../widgets/task_headline.dart';

class ManagerTaskDetailsScreen extends ConsumerStatefulWidget {
  final String taskId;
  final buttonKey = UniqueKey();

  ManagerTaskDetailsScreen({super.key, required this.taskId});

  @override
  ConsumerState<ManagerTaskDetailsScreen> createState() =>
      _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends ConsumerState<ManagerTaskDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskDetailsBloc>().getTaskDetailsById(widget.taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S().task_details)),
        body: BlocConsumer<TaskDetailsBloc, TaskDetailsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TaskDetailsDone) {
                List<bool> selected = [];
                double progress = 0;

                final taskDetails = state.adminTasksModel;
                taskDetails.subTasks!.forEach((e) {
                  selected.add(e.isCompleted!);
                  if (e.isCompleted!) progress++;
                });
                progress /= selected.length;
                return Scaffold(
                  body: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskDetailsWidget(
                        title: '${taskDetails.title}',
                        priorityId: taskDetails.priorityId!,
                        statusId: taskDetails.statusId!,
                        progress: progress,
                      ),
                      TaskInfoWidget(
                        userName: '${taskDetails.userName}',
                        userImage:
                            '${AppConstants.subDomain}${taskDetails.user?.imageName}',
                        endDate: DateTime.parse(taskDetails.endDate!),
                        startDate: DateTime.parse(taskDetails.startDate!),
                      ),
                      DescriptionWidget(
                          description: '${taskDetails.description}'),
                      AppSizes.size20.verticalSpace,
                      TaskHeadLineWidget(
                          title: S().subtasks_click_to_select,
                          icon: Assets.icons.subtasks),
                      ManagerSubTaskWidget(
                          taskDetails: taskDetails, selected: selected),
                      Text(S().comments),
                      ManagerCommentsWidget(tasksModel: taskDetails),
                      ManagerAddCommentWidget(taskDetails),
                    ]
                        .addSeparator(child: AppSizes.size10.verticalSpace)
                        .toList(),
                  ).paddingSymmetric(
                          vertical: AppSizes.size20.h,
                          horizontal: AppSizes.size10.w)),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: AppDefaultButton(
                      key: widget.buttonKey,
                      backgroundColor: AppColors.colors.darkBlue,
                      onPressed: () async {
                        ref
                            .read(buttonControllerProvider.notifier)
                            .setLoadingStatus(widget.buttonKey);
                        final subTasksLength = taskDetails.subTasks!.length;
                        final selectedLength = selected.length;
                        final commonLength =
                            min(subTasksLength, selectedLength);
                        List<SubTasks> list = [];
                        for (int i = 0; i < commonLength; i++) {
                          list.add(SubTasks(
                              isCompleted: selected[i],
                              id: taskDetails.subTasks![i].id));
                        }
                        final response = await DioHelper.putData(
                            url: Api.updateSubTask,
                            data: {
                              'taskId': taskDetails.id,
                              'userSubTasks': list
                                  .map((e) => {
                                        'id': e.id,
                                        'isCompleted': e.isCompleted
                                      })
                                  .toList()
                            });
                        if (response?.statusCode == 200) {
                          ref.invalidate(filtersControllerProvider);
                          ref.invalidate(dashboardControllerProvider);
                          ref.invalidate(managerAllTasksControllerProvider);
                          ref
                              .read(buttonControllerProvider.notifier)
                              .setSuccessStatus(widget.buttonKey);

                          context
                              .read<ManagerStatisticsCubit>()
                              .getManagerStatistics();
                          AppRouter.router.pop();
                          Toast.showSuccessToast(S().task_edited_successfully);
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
              } else if (state is TaskDetailsLoading) {
                return const CustomLoadingWidget();
              }
              return const SizedBox.shrink();
            }));
  }
}
