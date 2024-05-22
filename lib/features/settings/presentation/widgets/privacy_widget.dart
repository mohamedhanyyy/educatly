import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/font_system/app_fonts.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/styles_manager.dart';
import '../../../../core/constants/constants.dart';
import '../../data/model/privacy.dart';

class PrivacyWidget extends StatelessWidget {
  final Privacy privacy;

  const PrivacyWidget({super.key, required this.privacy});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          privacy.title,
          style: StylesManager.bold(
            fontSize: AppFonts.font.medium.sp,
          ),
        ),
        AppSizes.size10.verticalSpace,
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: AppSizes.size4.w,
                margin: EdgeInsetsDirectional.only(
                  end: AppSizes.size6.w,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: AppConstants.defaultBorderRadius,
                ),
              ),
              Expanded(
                child: Text(
                  privacy.description,
                  style: StylesManager.medium(
                    fontSize: AppFonts.font.small.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
