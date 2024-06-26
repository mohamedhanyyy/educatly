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
import '../controller/edit_task_controller.dart';

adminEditManagers(BuildContext context, WidgetRef ref) {
  ref.read(editTaskControllerProvider.notifier).clearList();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useRootNavigator: true,
    builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: editTaskManagers()),
  );
}

class editTaskManagers extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();

  editTaskManagers({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref
        .watch(getManagersControllerProvider)
        .when(
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stackTrace) => RefreshWidget(
                  onTap: () async =>
                      await ref.refresh(getManagersControllerProvider),
                ),
            data: (data) {
              return Column(
                children: [
                  CustomTextInputField(
                    onChanged: (val) {
                      ref
                          .read(getManagersControllerProvider.notifier)
                          .searchManager(val);
                    },
                    label: S().write_employee_name,
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    validator: (value) =>
                        ValidationService.notEmptyField(value),
                  ),
                  if (ref
                          .watch(editTaskControllerProvider)
                          .searchAssigneToList
                          ?.isEmpty ==
                      true)
                    Flexible(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return AppSizes.size10.verticalSpace;
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              ref
                                  .read(editTaskControllerProvider.notifier)
                                  .setData(selectedAssigne: data[index]);
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
                                  "${AppConstants.subDomain}${data[index].imageName}",
                                ),
                              ),
                            ),
                            title: Text(
                              '${data[index].userName}',
                              style: StylesManager.regular(fontSize: 13.sp),
                            ),
                          );
                        },
                        itemCount: data.length,
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
                                  .read(editTaskControllerProvider.notifier)
                                  .setData(
                                      selectedAssigne: ref
                                          .watch(getManagersControllerProvider)
                                          .requireValue[index]);
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
                                  "${AppConstants.subDomain}${ref.watch(getManagersControllerProvider).requireValue[index].imageName}",
                                ),
                              ),
                            ),
                            title: Text(
                              '${ref.watch(getManagersControllerProvider).requireValue[index].userName}',
                              style: StylesManager.regular(fontSize: 13.sp),
                            ),
                          );
                        },
                        itemCount: ref
                            .watch(getManagersControllerProvider)
                            .requireValue
                            .length,
                        physics: const BouncingScrollPhysics(),
                      ),
                    )
                ],
              );
            })
        .defaultScreenPadding;
  }
}
