import 'package:flutter/material.dart';

import '../../config/router/app_router.dart';
import '../../features/manager/home/data/model/statistics.dart';

class StatisticsData {
  StatisticsData._();

  static const List<StatisticsModel> statisticsList = [
    StatisticsModel(
      id: 0,
      color: 0xffF81FAC,
      icon: "assets/icons/all.svg",
    ),
    StatisticsModel(
      id: 1,
      color: 0xffFA942F,
      icon: "assets/icons/progress.svg",
    ),
    StatisticsModel(
      id: 2,
      color: 0xff01DF85,
      icon: "assets/icons/done.svg",
    ),
    StatisticsModel(
      id: 3,
      color: 0xff14BBD8,
      icon: "assets/icons/next.svg",
    ),
  ];

  static String getStatisticsTitle(int id) {
    if (Localizations.localeOf(AppRouter.navigatorState.currentContext!)
            .languageCode ==
        'ar') {
      return StatisticsARTitleList[id] ?? "No Title";
    } else {
      return StatisticsENTitleList[id] ?? "No Title";
    }
  }

  static Color getStatisticsColor(int color) {
    return Color(color);
  }

  /// Statistics Titles Arabic
  static Map<int, String> StatisticsARTitleList = {
    0: "جميع المهام",
    1: "جديدة",
    2: "قيد التنفيذ",
    3: "مكتملة"
  };

  /// Statistics Titles English
  static Map<int, String> StatisticsENTitleList = {
    0: "All",
    1: "New",
    2: "In progress",
    3: "Completed"
  };
}
