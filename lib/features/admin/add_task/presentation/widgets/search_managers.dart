import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/features/admin/get_managers/presentation/controller/get_managers_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../../../core/widgets/refresh_widget.dart';
import '../controller/add_task_controller.dart';

searchManagers(BuildContext context, WidgetRef ref) {
  ref.read(addTaskControllerProvider.notifier).clearList();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useRootNavigator: true,
    builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AdminSearchManagers()),
  );
}

class AdminSearchManagers extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final watcher = ref.watch(addTaskControllerProvider);
    final reader = ref.read(addTaskControllerProvider.notifier);
    return ref
        .watch(getManagersControllerProvider)
        .when(
            loading: () => Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stackTrace) => RefreshWidget(
                onTap: () async =>
                    await ref.refresh(getManagersControllerProvider)),
            data: (managers) {
              return Column(
                children: [
                  CustomTextInputField(
                    onChanged: (val) {
                      reader.searchCompanyName(val!, managers);
                    },
                    label: S().write_employee_name,
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    validator: (value) =>
                        ValidationService.notEmptyField(value),
                  ),
                  AppSizes.size10.verticalSpace,
                  if (watcher.searchManagerList?.isEmpty == true)
                    Flexible(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return AppSizes.size10.verticalSpace;
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              ref
                                  .read(addTaskControllerProvider.notifier)
                                  .setData(selectedManager: managers[index]);
                              AppRouter.router.pop();
                            },
                            leading: Container(
                              width: 40.h,
                              height: 40.h,
                              padding: EdgeInsets.all(1.h),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colors.background
                                    .withOpacity(0.5),
                              ),
                              child: ClipOval(
                                child: AppCachedNetworkImage(
                                    "${AppConstants.subDomain}${managers[index].imageName}"),
                              ),
                            ),
                            title: Text(
                              '${managers[index].userName}',
                              style: StylesManager.regular(fontSize: 13.sp),
                            ),
                          );
                        },
                        itemCount: managers.length,
                        // shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      ).defaultScreenPadding,
                    )
                  else
                    Flexible(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return AppSizes.size10.verticalSpace;
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              ref
                                  .read(addTaskControllerProvider.notifier)
                                  .setData(
                                      selectedManager: ref
                                          .watch(addTaskControllerProvider)
                                          .searchManagerList?[index]);
                              AppRouter.router.pop();
                            },
                            leading: Container(
                              width: 40.h,
                              height: 40.h,
                              padding: EdgeInsets.all(1.h),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colors.background
                                    .withOpacity(0.5),
                              ),
                              child: ClipOval(
                                child: AppCachedNetworkImage(
                                  "${AppConstants.subDomain}${watcher.searchManagerList?[index].imageName}",
                                ),
                              ),
                            ),
                            title: Text(
                              '${watcher.searchManagerList?[index].userName}',
                              style: StylesManager.regular(fontSize: 13.sp),
                            ),
                          );
                        },
                        itemCount: watcher.searchManagerList?.length ?? 0,
                        // shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                      ),
                    )
                ],
              );
            })
        .defaultScreenPadding;
  }
}
