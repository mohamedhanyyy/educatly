import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';

class FilterWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function()? onTap;

  const FilterWidget({
    super.key,
    this.onTap,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConstants.defaultBorderRadius,
      child: Container(
        padding: AppConstants.defaultVerticalPadding,
        decoration: BoxDecoration(
            borderRadius: AppConstants.defaultBorderRadius,
            color: isSelected ? AppColors.colors.primary : null,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, spreadRadius: 5, color: Colors.grey.shade100)
            ]),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            title,
            style: isSelected
                ? StylesManager.bold(
                    fontSize: AppFonts.font.large,
                    color: Theme.of(context).scaffoldBackgroundColor)
                : StylesManager.medium(fontSize: AppFonts.font.medium.sp),
          ),
        ),
      ),
    );
  }
}
