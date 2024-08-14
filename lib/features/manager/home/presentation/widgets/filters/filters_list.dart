import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/controllers/theme/theme_controller.dart';
import 'package:taskaty/core/extensions/iterator_extension.dart';

import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/constants/statistics.dart';
import '../../controller/calender_controller.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/filters_controller.dart';
import 'filter_widget.dart';

class FiltersListWidget extends StatelessWidget {
  final FixedExtentScrollController _controller;

  const FiltersListWidget(
      {super.key, required FixedExtentScrollController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    final _filterData = StatisticsData.statisticsList.skip(1);
    return Container(
      height: 60.h,
      padding: AppConstants.defaultPadding,
      decoration: AppConstants.defaultBoxDecoration
          .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
      child: Row(
        children: _filterData
            .map(
              (e) => Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final _isSelected =
                        ref.watch(filtersControllerProvider) == e.id;
                    return DecoratedBox(
                      decoration: BoxDecoration(boxShadow: [
                        if (ref.watch(themeControllerProvider) ==
                            ThemeMode.light)
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 5,
                              color: Colors.grey.shade300)
                      ]),
                      child: FilterWidget(
                        title: StatisticsData.getStatisticsTitle(e.id),
                        isSelected: _isSelected,
                        onTap: ref.watch(dashboardControllerProvider).isLoading
                            ? null
                            : () {
                                if (!_isSelected) {
                                  ref
                                      .read(filtersControllerProvider.notifier)
                                      .selectFilter(e.id);
                                  ref
                                      .watch(
                                          calenderControllerProvider.notifier)
                                      .selectFullDate(
                                        ref
                                            .watch(calenderControllerProvider)
                                            .selectedDate,
                                        _controller,
                                      );
                                }
                              },
                      ),
                    );
                  },
                ),
              ),
            )
            .toList()
            .addSeparator(child: AppSizes.size10.horizontalSpace)
            .toList(),
      ),
    );
  }
}
