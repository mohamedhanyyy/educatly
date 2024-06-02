import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/extensions/context_extension.dart';
import 'package:taskaty/core/widgets/custom_text_field.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/admin_tasks_filter_controller.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/get_admin_tasks_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/widgets/refresh_widget.dart';
import '../widgets/admin_home_appbar.dart';
import '../widgets/admin_home_filter.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/statistics_widget.dart';
import '../widgets/task_item_widget.dart';

class AdminMainScreen extends ConsumerStatefulWidget {
  AdminMainScreen({super.key});

  @override
  ConsumerState<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends ConsumerState<AdminMainScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filterWatcher = ref.watch(adminTasksFilterControllerProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppSizes.size80.h),
          child: AdminHomeAppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StatisticsWidget(),
            AdminHomeFilterWidget(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.size8.h),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 45.h,
                      child: CustomTextInputField(
                        controller: searchController,
                        onChanged: (val) {
                          if (val!.length % 3 == 0)
                            ref
                                .read(
                                    adminTasksFilterControllerProvider.notifier)
                                .setData(searchText: val);
                        },
                        label: S().search_by_task_name,
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.size10.w),
                          child: SvgPicture.asset('assets/icons/search1.svg',
                              colorFilter: Theme.of(context)
                                  .secondaryHeaderColor
                                  .toColorFilter),
                        ),
                      ),
                    ),
                  ),
                  AppSizes.size6.horizontalSpace,
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
                            borderRadius:
                                BorderRadius.circular(AppSizes.size5.r))),
                    onPressed: () {
                      if (filterWatcher.searchText == null &&
                          filterWatcher.selectedPriorityId == null &&
                          filterWatcher.selectedStatusId == null &&
                          filterWatcher.selectedManager == null &&
                          searchController.text == '') return;

                      ref.invalidate(adminTasksFilterControllerProvider);
                      searchController.clear();
                      Toast.showToast(S().filter_reset);
                    },
                  ),
                ],
              ),
            ),
            ref.watch(getAdminTasksControllerProvider).when(
                  loading: () => CustomLoadingWidget(50.h),
                  error: (error, stackTrace) => RefreshWidget(
                      onTap: () async =>
                          await ref.refresh(getAdminTasksControllerProvider)),
                  data: (tasks) {
                    if (tasks.isEmpty) return noTasksWidget();
                    return ListView.builder(
                      itemBuilder: (context, index) =>
                          TaskItemWidget(task: tasks.elementAt(index)),
                      shrinkWrap: true,
                      itemCount: tasks.length,
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

Padding noTasksWidget() {
  return Padding(
      padding: EdgeInsets.only(top: AppSizes.size100.h),
      child: Center(
          child: Text(S().no_tasks,
              style: StylesManager.semiBold(fontSize: AppSizes.size16.sp))));
}
