import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/custom_text_field.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/core/widgets/refresh_widget.dart';
import 'package:taskaty/features/admin/get_managers/presentation/controller/get_managers_controller.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/admin_tasks_filter_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/network_image.dart';

class AdminHomeSelectManagerWidget extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reader = ref.read(adminTasksFilterControllerProvider.notifier);
    final watcher = ref.watch(adminTasksFilterControllerProvider);
    return ref.watch(getManagersControllerProvider).when(
        data: (data) {
          return Column(
            children: [
              CustomTextInputField(
                label: S().manager_name,
                controller: controller,
                onChanged: (val) {
                  reader.searchManager(text: controller.text, managers: data);
                  print('hany');
                  print(watcher.managers?.length);
                },
              ),
              AppSizes.size20.verticalSpace,
              if (controller.text.isEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      AppSizes.size10.verticalSpace,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        reader.setData(selectedManager: data[index]);
                        AppRouter.router.pop();
                      },
                      leading: Container(
                        width: 40.h,
                        height: 40.h,
                        padding: EdgeInsets.all(1.h),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.colors.background.withOpacity(0.5),
                        ),
                        child: ClipOval(
                          child: AppCachedNetworkImage(
                              '${AppConstants.subDomain}${data[index].imageName}'),
                        ),
                      ),
                      title: Text(
                        '${data[index].userName}',
                        style: StylesManager.regular(fontSize: 13.sp),
                      ),
                    );
                  },
                  itemCount: data.length,
                  physics: const BouncingScrollPhysics(),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return AppSizes.size10.verticalSpace;
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        reader.setData(
                            selectedManager: watcher.managers?[index]);

                        AppRouter.router.pop();
                      },
                      leading: Container(
                          width: 40.h,
                          height: 40.h,
                          padding: EdgeInsets.all(1.h),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colors.background.withOpacity(0.5),
                          ),
                          child: ClipOval(
                              child: AppCachedNetworkImage(
                                  '${AppConstants.subDomain}${watcher.managers?[index].imageName}'))),
                      title: Text(
                        '${watcher.managers?[index].userName}',
                        style: StylesManager.regular(fontSize: 13.sp),
                      ),
                    );
                  },
                  itemCount: watcher.managers?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                )
            ],
          ).defaultScreenPadding;
        },
        error: (e, ee) {
          return RefreshWidget(onTap: () {
            ref.invalidate(getManagersControllerProvider);
          });
        },
        loading: () => CustomLoadingWidget(0));
  }
}
