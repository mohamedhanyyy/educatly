import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/features/admin/home/presentation/widgets/priority_bottom_sheet.dart';
import 'package:taskaty/features/admin/home/presentation/widgets/task_status_bottom_sheet.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/helpers/mappers.dart';
import '../../../tasks/presentation/controller/admin_tasks_filter_controller.dart';
import 'admin_home_select_manager_widget.dart';

class AdminHomeFilterWidget extends ConsumerWidget {
  final customWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterWatcher = ref.watch(adminTasksFilterControllerProvider);

    return Padding(
      padding: EdgeInsets.only(right: 4, left: 4, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  showDragHandle: true,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AdminFilterTaskStatusWidget());
            },
            child: Container(
              height: AppSizes.size40.h,
              width: customWidth * .29,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size12.w),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                // if(ref.wa)
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(AppSizes.size10.r),
              ),
              child: DropdownButton(
                  isExpanded: true,
                  hint: Text(
                    filterWatcher.selectedStatusId == null
                        ? S().status
                        : statusIdMapper(filterWatcher.selectedStatusId),
                    textAlign: TextAlign.center,
                    style: StylesManager.medium(fontSize: AppSizes.size12.sp),
                  ),
                  underline: SizedBox.shrink(),
                  icon: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Image.asset(
                      'assets/images/arrowDown.png',
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  items: null,
                  onChanged: (val) {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
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
                width: customWidth * .29,
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size12.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(10),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Image.asset('assets/images/arrowDown.png',
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    items: null,
                    onChanged: (val) {}),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  showDragHandle: true,
                  useRootNavigator: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AdminHomeSelectPriorityWidget());
            },
            child: Container(
              height: AppSizes.size40.h,
              width: customWidth * .29,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size12.w),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Color(0xff3D7DF626),),
              ),
              child: DropdownButton(
                  isExpanded: true,
                  hint: Text(
                    filterWatcher.selectedPriorityId != null
                        ? priorityIdMapper(filterWatcher.selectedPriorityId)
                        : S().priority,
                    style: StylesManager.medium(fontSize: 13.sp),
                  ),
                  underline: SizedBox.shrink(),
                  icon: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
    );
  }
}
