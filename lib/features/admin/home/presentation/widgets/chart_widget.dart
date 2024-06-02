import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';
import 'package:taskaty/features/manager/stats/stats_model.dart';

import '../../../../../config/theme/color_system/app_colors.dart';
import '../bloc/statstics_bloc.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late AdminStatsticsCubit statsCubit;

  @override
  void initState() {
    super.initState();
    statsCubit = context.read<AdminStatsticsCubit>();
    statsCubit.getStats();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminStatsticsCubit, CubitState>(
        builder: (context, state) {
      if (state == CubitState.done) {
        num totalSum =
            statsCubit.statisticsModel!.statsData!.taskInProgressCount! +
                statsCubit.statisticsModel!.statsData!.taskNewCount! +
                statsCubit.statisticsModel!.statsData!.taskCompleteCount!;
        num inProgressCount =
            statsCubit.statisticsModel!.statsData!.taskInProgressCount!;
        num newCount = statsCubit.statisticsModel!.statsData!.taskNewCount!;
        num completedCount =
            statsCubit.statisticsModel!.statsData!.taskCompleteCount!;
        //
        double completedCountPrcentage = completedCount / totalSum;
        double inProgressCountPrcentage = inProgressCount / totalSum;
        double newCountPrcentage = newCount / totalSum;
        return PieChart(
          PieChartData(
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(
                  value: completedCountPrcentage != 0
                      ? completedCountPrcentage
                      : 1,
                  title:
                      '${(completedCountPrcentage * 100).toStringAsFixed(1)}%',
                  color: Colors.red,
                  titleStyle: TextStyle(fontSize: 10)),
              PieChartSectionData(
                  value: newCountPrcentage != 0 ? newCountPrcentage : 1,
                  title: '${(newCountPrcentage * 100).toStringAsFixed(1)}%',
                  color: Colors.green,
                  titleStyle: TextStyle(fontSize: 10)),
              PieChartSectionData(
                  value: inProgressCountPrcentage != 0
                      ? inProgressCountPrcentage
                      : 1,
                  title:
                      '${(inProgressCountPrcentage * 100).toStringAsFixed(1)}%',
                  color: Colors.orange,
                  titleStyle: TextStyle(fontSize: 12)),
            ],
          ),
        );
      } else if (state == CubitState.loading)
        return Center(child: CircularProgressIndicator.adaptive());
      return const SizedBox.shrink();
    });
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size, this.color);

  final x;
  final y;
  final String size;
  final Color color;
}

List<ChartData> chartData(StatsData model) => [
      ChartData(model.taskNewCount!, model.taskAllCount!,
          '${model.taskNewCount}%', Color(0xff14BBD8)),
      ChartData(model.taskInProgressCount, model.taskAllCount,
          '${model.taskInProgressCount}%', Colors.orange),
      ChartData(model.taskCompleteCount, model.taskAllCount,
          '${model.taskCompleteCount}%', AppColors.colors.green),
    ];
