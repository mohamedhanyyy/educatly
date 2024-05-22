import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/widgets/network_image.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().notifications)),
      body: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        separatorBuilder: (_, __) => Divider(
          height: AppSizes.size5.h,
          color: Theme.of(context).cardColor,
        ),
        itemBuilder: (_, index) {
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
        },
      ),
    );
  }
}
