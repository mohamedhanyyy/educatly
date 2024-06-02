import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/core/extensions/context_extension.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/helpers/toast_helper.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../add_task/presentation/widgets/add_task_date_picker_widget.dart';
import '../../../tasks/presentation/controller/admin_tasks_filter_controller.dart';

final TextEditingController searchController = TextEditingController();

class AdminHomeSearchWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterWatcher = ref.watch(adminTasksFilterControllerProvider);
    return Padding(
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
                        .read(adminTasksFilterControllerProvider.notifier)
                        .setData(searchText: val);
                },
                label: S().search_by_task_name,
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size10.w),
                  child: SvgPicture.asset('assets/icons/search1.svg',
                      colorFilter:
                          Theme.of(context).secondaryHeaderColor.toColorFilter),
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
                colorFilter:
                    Theme.of(context).scaffoldBackgroundColor.toColorFilter),
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(AppSizes.size36.sp.h),
                backgroundColor: AppColors.colors.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.size5.r))),
            onPressed: () {
              if (filterWatcher.searchText == null &&
                  filterWatcher.selectedPriorityId == null &&
                  filterWatcher.selectedStatusId == null &&
                  filterWatcher.selectedManager == null &&
                  searchController.text == '') return;

              ref.invalidate(adminTasksFilterControllerProvider);
              searchController.clear();
              Toast.showSuccessToast(S().filter_reset);
            },
          ),
        ],
      ),
    );
  }
}
