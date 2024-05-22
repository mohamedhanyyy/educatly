import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/extensions/iterator_extension.dart';

import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/widgets/dash_widget.dart';
import 'date_widget.dart';
import 'user_widget.dart';

class TaskInfoWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  final DateTime endDate;
  final DateTime startDate;

  const TaskInfoWidget({
    super.key,
    required this.userName,
    required this.userImage,
    required this.endDate,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: AppConstants.defaultBorderRadius,
        border: Border.all(
          color: AppColors.colors.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: DateWidget(
              date: startDate,
              dateType: DateType.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: DateWidget(
              date: endDate,
              dateType: DateType.end,
            ),
          ),
          Expanded(
            flex: 1,
            child: UserWidget(
              userName: userName,
              userImage: '',
            ),
          )
        ]
            .addSeparator(
              child: DashWidget(
                color: AppColors.colors.primary.withOpacity(0.3),
              ),
            )
            .toList(),
      ),
    );
  }
}
