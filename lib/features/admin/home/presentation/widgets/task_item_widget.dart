import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/core/extensions/context_extension.dart';
import 'package:taskaty/core/extensions/date.dart';
import 'package:taskaty/core/widgets/network_image.dart';
import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';
import '../../../../../config/router/app_router_keys.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/helpers/mappers.dart';

class TaskItemWidget extends ConsumerWidget {
  TaskItemWidget({super.key, required this.task});

  final AdminTasksModel task;

  @override
  Widget build(BuildContext ctx, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          AppRouter.router.pushNamed(AppRoutes.taskaDetails,
              queryParameters: {AppRouterKeys.taskaDetails: jsonEncode(task)});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorStatusIdMapper(task.statusId),
          ),
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsetsDirectional.only(start: 5),
          child: Card(
            elevation: 0,
            borderOnForeground: false,
            margin: EdgeInsets.zero,
            color: Theme.of(ctx).scaffoldBackgroundColor,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(ctx).highlightColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child:
                                      statusPrioritySvgMapper(task.priorityId),
                                ),
                                SizedBox(
                                  width: ScreenUtil().screenWidth*.6,
                                  child: Text(
                                    '${task.title}',
                                    style: StylesManager.semiBold(
                                      fontSize: 16.sp,
                                      color: Theme.of(ctx).secondaryHeaderColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.colors.lightGreen,
                                      border: Border.all(
                                        color: AppColors.colors.green,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(Assets.icons.clock,
                                            colorFilter: AppColors
                                                .colors.green.toColorFilter),
                                        SizedBox(width: 5),
                                        Text('${DateTime.parse(task.startDate!).getDifferenceFromToday()}', style: StylesManager.bold(
                                              color: AppColors.colors.green,
                                              fontSize: AppSizes.size11),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  AppColors.colors.primary.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    clipBehavior: Clip.antiAlias,
                                    child: AppCachedNetworkImage(
                                      AppConstants.userAvatar,
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            AppSizes.size5.verticalSpace,
                            Text(
                              "${task.userName}",
                              style: StylesManager.semiBold(),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        percent: 0.96,
                        animation: true,
                        animationDuration: 100,
                        progressColor: AppColors.colors.darkBlue,
                        barRadius: Radius.circular(10),
                        trailing: Text(
                          '  97 %  ',
                          style: StylesManager.bold(
                            color: AppColors.colors.darkBlue,
                          ),
                        ),
                      ),
                    )
                  ],
                ).defaultScreenPadding,
              ),
            ),
          ),
        ),
      ),
    );
  }
}