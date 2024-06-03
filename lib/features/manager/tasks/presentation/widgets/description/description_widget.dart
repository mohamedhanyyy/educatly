import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/assets.dart';
import '../task_headline.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskHeadLineWidget(
          title: S().task_description,
          icon: Assets.icons.description,
        ),
        AppSizes.size10.verticalSpace,
        Text(
          description,
          style: StylesManager.regular(fontSize: AppFonts.font.medium.sp),
        ),
      ],
    );
  }
}
