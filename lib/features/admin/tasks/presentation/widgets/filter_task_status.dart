import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../controller/admin_tasks_filter_controller.dart';
import '../controller/get_admin_tasks_controller.dart';

class FilterTaskStatus extends ConsumerStatefulWidget {
  const FilterTaskStatus({super.key});

  @override
  ConsumerState<FilterTaskStatus> createState() => _FilterTaskStatusState();
}

class _FilterTaskStatusState extends ConsumerState<FilterTaskStatus> {
  int segmentSelected = 0;

  @override
  Widget build(BuildContext context) {
    final reader = ref.read(adminTasksFilterControllerProvider.notifier);

    return SizedBox(
      width: ScreenUtil().screenWidth,
      child: MaterialSegmentedControl(
        horizontalPadding: EdgeInsets.zero,
        verticalOffset: 12,
        children: {
          0: Text(S().neww),
          1: Text(S().in_progress),
          2: Text(S().completed),
        },
        borderWidth: .3,
        selectedTextStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
        unselectedTextStyle: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            color: Theme.of(context).secondaryHeaderColor),
        selectionIndex: segmentSelected,
        borderColor: Colors.grey,
        selectedColor: AppColors.colors.darkBlue,
        unselectedColor: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: 5,
        onSegmentTapped: (index) {
          setState(() {
            segmentSelected = index;
            reader.setData(selectedStatusId: index + 1);
            ref.invalidate(getAdminTasksControllerProvider);
          });
        },
      ),
    );
  }
}
