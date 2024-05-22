import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/network_image.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/widgets/refresh_widget.dart';
import '../controller/get_managers_controller.dart';

class GetManagersScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S().all_managers),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.sp,
            padding: EdgeInsets.zero,
            onPressed: () {
              AppRouter.router.pushNamed(AppRoutes.addUserSuperAdmin);
            },
          )
        ],
      ),
      body: ref
          .watch(getManagersControllerProvider)
          .when(
            loading: () => Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stackTrace) => RefreshWidget(
              onTap: () async =>
                  await ref.refresh(getManagersControllerProvider),
            ),
            data: (managers) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return managerItemWidget(
                      manager: managers[index], context: context, ref: ref);
                },
                shrinkWrap: true,
                itemCount: managers.length,
                physics: const BouncingScrollPhysics(),
              ).defaultScreenPadding;
            },
          )
          .defaultScreenPadding,
    );
  }

  Widget managerItemWidget(
      {required ManagerModel manager,
      required BuildContext context,
      required WidgetRef ref}) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, right: 27.w, left: 27.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.colors.primary,
          )),
      child: Stack(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.colors.primary.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAlias,
                      child: AppCachedNetworkImage(manager.imageName ?? '',
                          width: 30, height: 30, fit: BoxFit.cover)),
                ),
              ),
              AppSizes.size5.verticalSpace,
              Text(
                "${manager.userName}",
                style: StylesManager.semiBold(
                  color: AppColors.colors.darkBlue,
                  fontSize: 13.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120.w,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/bag.svg'),
                        AppSizes.size5.horizontalSpace,
                        Flexible(
                          child: Text(
                            '${S().completed_tasks} : 250',
                            style: StylesManager.regular(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 15,
                    color: AppColors.colors.chartBlue,
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/stat.svg'),
                        AppSizes.size5.horizontalSpace,
                        Flexible(
                          child: Text(
                            '${S().all_tasks} : 500',
                            style: StylesManager.regular(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
