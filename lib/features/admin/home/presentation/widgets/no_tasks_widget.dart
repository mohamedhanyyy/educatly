import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: AppSizes.size50.h),
        child: Column(
          children: [
            Text(S().no_tasks,
                style: StylesManager.semiBold(fontSize: AppSizes.size16.sp)),
            Lottie.asset('assets/json/notasks.json', width: 100, height: 100)
          ],
        ));
  }
}
