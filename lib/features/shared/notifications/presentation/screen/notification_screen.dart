import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';
import 'package:taskaty/features/shared/notifications/presentation/cubit/notification_cubit.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_router_keys.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/services/database/preferences_helper.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../model/notifications_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationCubit notificationCubit;
  @override
  void initState() {
    super.initState();
    notificationCubit = context.read<NotificationCubit>();
    notificationCubit.getUserNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S().notifications)),
        body: BlocBuilder<NotificationCubit, CubitState>(
          builder: (context, state) {
            if (state == CubitState.empty)
              return Center(
                child: Text(S().no_notifications_right_now,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700)),
              );
            else if (state == CubitState.done) {
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) => notificationWidget(
                      notificationCubit.notificationsModel!.data![index]),
                  shrinkWrap: true,
                  itemCount:
                      notificationCubit.notificationsModel?.data?.length);
            } else if (state == CubitState.loading) {
              return const CustomLoadingWidget();
            }
            return const SizedBox.shrink();
          },
        ));
  }

  Widget notificationWidget(NotificationData data) {
    return InkWell(
      onTap: () {
        if (PreferencesHelper.getUserModel?.role == 'Manager') {
          AppRouter.router.pushNamed('${AppRoutes.managerTaskDetails}',
              queryParameters: {
                AppRouterKeys.managerTaskDetails: data.id.toString()
              });
        } else {
          AppRouter.router.pushNamed('${AppRoutes.adminTaskDetails}',
              queryParameters: {
                AppRouterKeys.adminTaskDetails: data.id.toString()
              });
        }
        if (data.isRead != true) {
          notificationCubit.makeNotificationAsRead(data.id);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: data.isRead == true
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).highlightColor,
          border: Border.all(
              color: data.isRead == false
                  ? AppColors.colors.black
                  : Theme.of(context).highlightColor),
        ),
        child: ListTile(
          tileColor: Colors.transparent,
          leading: Container(
            width: 40.h,
            height: 40.h,
            padding: EdgeInsets.all(1.h),
            // clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colors.background.withOpacity(0.5),
            ),
            child: const ClipOval(
              child: AppCachedNetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjIE9x_0IgzoW3whWyqVDXqK0K1hNxzNf_6meiHJJVTh4z7cz_LLY7aYXo6B-PfxqmYDc&usqp=CAU",
              ),
            ),
          ),
          title: Text(
            "${data.title}",
            style: StylesManager.regular(
                fontSize: AppFonts.font.medium.sp, color: Colors.green),
          ),
          subtitle: Text(
            '${data.body}',
            style: StylesManager.regular(
              fontSize: AppFonts.font.xSmall.sp,
            ),
          ),
        ).defaultScreenPadding,
      ),
    );
  }
}
