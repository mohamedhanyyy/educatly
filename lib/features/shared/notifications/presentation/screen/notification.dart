import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/loading_widget.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';
import 'package:taskaty/features/shared/notifications/presentation/cubit/notification_cubit.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/widgets/network_image.dart';

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
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              );
            else if (state == CubitState.done) {
              return ListView.builder(
                  itemBuilder: (context, index) => buildDefaultScreenPadding(),
                  shrinkWrap: true,
                  itemCount: 5);
            } else if (state == CubitState.loading) {
              return CustomLoadingWidget();
            }
            return const SizedBox.shrink();
          },
        ));
  }

  Widget buildDefaultScreenPadding() {
    return ListTile(
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
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjIE9x_0IgzoW3whWyqVDXqK0K1hNxzNf_6meiHJJVTh4z7cz_LLY7aYXo6B-PfxqmYDc&usqp=CAU",
          ),
        ),
      ),
      title: Text(
        "تم إنهاء المهمة الأولى بنجاح",
        style: StylesManager.regular(
            fontSize: AppFonts.font.medium.sp, color: Colors.green),
      ),
      subtitle: Text(
        '04:30 AM',
        style: StylesManager.regular(
          fontSize: AppFonts.font.xSmall.sp,
        ),
      ),
    ).defaultScreenPadding;
  }
}
