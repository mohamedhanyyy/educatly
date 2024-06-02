import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/l10n/generated/l10n.dart';
import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/config/router/app_routing_paths.dart';
import 'package:taskaty/config/theme/styles_manager.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/context_extension.dart';
import 'package:taskaty/features/admin/home/presentation/widgets/no_tasks_widget.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/admin_tasks_filter_controller.dart';
import 'package:taskaty/features/admin/tasks/presentation/widgets/filter_tasks_date_picker_widget.dart';

import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/helpers/mappers.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/refresh_widget.dart';
import '../../../home/presentation/widgets/admin_home_select_manager_widget.dart';
import '../../../home/presentation/widgets/priority_bottom_sheet.dart';
import '../../../home/presentation/widgets/task_item_widget.dart';
import '../../data/model/admin_tasks_model.dart';
import '../controller/get_admin_tasks_controller.dart';
import '../widgets/filter_task_status.dart';

class AdminTasksScreen extends ConsumerStatefulWidget {
  const AdminTasksScreen({super.key});

  @override
  ConsumerState<AdminTasksScreen> createState() => _AdminTasksScreenState();
}

class _AdminTasksScreenState extends ConsumerState<AdminTasksScreen> {
  final TextEditingController searchController = TextEditingController();

  bool isLoading = false;

  List<AdminTasksModel>? adminTasks;
  // late AdminGetTasksBloc adminBloc;
  @override
  void initState() {
    super.initState();
    // adminBloc = context.read<AdminGetTasksBloc>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(adminTasksFilterControllerProvider.notifier)
          .setData(selectedStatusId: 1);
      // adminBloc.getAdminTasks(ref: ref);

      // ref.invalidate(getAdminTasksControllerProvider);
    });
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     adminBloc.getAdminTasks(ref: ref);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final filterWatcher = ref.watch(adminTasksFilterControllerProvider);

    final reader = ref.read(adminTasksFilterControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(S().all_tasks),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.sp,
            padding: EdgeInsets.zero,
            onPressed: () {
              AppRouter.router.pushNamed(AppRoutes.addTask);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.size4.w, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ScreenUtil().screenWidth * .45,
                    height: 40.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.size12.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  AdminHomeSelectPriorityWidget());
                        },
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            filterWatcher.selectedPriorityId != null
                                ? priorityIdMapper(
                                    filterWatcher.selectedPriorityId)
                                : S().priority,
                            style: StylesManager.medium(fontSize: 13.sp),
                          ),
                          underline: SizedBox.shrink(),
                          icon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/arrowDown.png',
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          items: null,
                          onChanged: (val) {},
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          useRootNavigator: true,
                          builder: (context) => AdminHomeSelectManagerWidget());
                    },
                    child: Container(
                      height: AppSizes.size40.h,
                      width: ScreenUtil().screenWidth * .45,
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.size12.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            filterWatcher.selectedManager != null
                                ? filterWatcher.selectedManager!.userName!
                                : S().manager,
                            style: StylesManager.medium(fontSize: 13.sp),
                          ),
                          underline: SizedBox.shrink(),
                          icon: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/arrowDown.png',
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          items: null,
                          onChanged: (val) {}),
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.size10.verticalSpace,
            FilterTasksDatePickerWidget(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 45.h,
                    child: CustomTextInputField(
                      controller: searchController,
                      onChanged: (val) {
                        reader.setData(searchText: val);
                      },
                      label: S().search_by_task_name,
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset('assets/icons/search1.svg',
                            colorFilter: Theme.of(context)
                                .secondaryHeaderColor
                                .toColorFilter),
                      ),
                    ),
                  )),
                  SizedBox(width: AppSizes.size6.w),
                  ElevatedButton.icon(
                    label: Text(
                      S().filter,
                      style: StylesManager.regular(
                          fontSize: AppSizes.size12.sp,
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    icon: SvgPicture.asset('assets/icons/reset.svg',
                        width: AppSizes.size12.sp,
                        height: AppSizes.size12.sp,
                        colorFilter: Theme.of(context)
                            .scaffoldBackgroundColor
                            .toColorFilter),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(AppSizes.size36.sp.h),
                        backgroundColor: AppColors.colors.darkBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      if (filterWatcher.searchText == null &&
                          filterWatcher.selectedPriorityId == null &&
                          filterWatcher.selectedStatusId == null &&
                          searchController.text == '') return;

                      ref.invalidate(adminTasksFilterControllerProvider);
                      ref.invalidate(getAdminTasksControllerProvider);
                      searchController.clear();
                      Toast.showToast(S().filter_reset);
                    },
                  ),
                ],
              ),
            ),
            FilterTaskStatus(),
            AppSizes.size10.verticalSpace,
            ref.watch(getAdminTasksControllerProvider).when(
                  loading: () => Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child:
                          Center(child: CircularProgressIndicator.adaptive())),
                  error: (error, stackTrace) => RefreshWidget(
                    onTap: () async =>
                        await ref.refresh(getAdminTasksControllerProvider),
                  ),
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
        ).defaultScreenPadding,
      ),
    );
  }
}
