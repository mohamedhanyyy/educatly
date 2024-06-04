import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/helpers/mappers.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.statusId});

  final statusId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: AppConstants.defaultHorizontalPadding,
      decoration: BoxDecoration(
        color: colorStatusIdMapper(statusId),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '${statusIdMapper(statusId)}',
        style: StylesManager.extraBold(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontSize: AppFonts.font.small.sp,
        ),
      ),
    );
  }
}
