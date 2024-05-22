import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import 'calender_actions.dart';
import 'calender_month.dart';

class CalenderWidget extends StatelessWidget {
  final FixedExtentScrollController _controller;

  const CalenderWidget({
    super.key,
    required FixedExtentScrollController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalenderActions(controller: _controller),
        AppSizes.size16.verticalSpace,
        CalenderMonthWidget(controller: _controller),
      ],
    );
  }
}
