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
        return PieChart(
          PieChartData(
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(
                  value: completedCount / totalSum,
                  title:
                      '${(completedCount / totalSum * 100).toStringAsFixed(1)}%',
                  color: Colors.green,
                  titleStyle: TextStyle(fontSize: 10)),
              PieChartSectionData(
                  value: newCount / totalSum,
                  title: '${(newCount / totalSum * 100).toStringAsFixed(1)}%',
                  color: Colors.blue,
                  titleStyle: TextStyle(fontSize: 10)),
              PieChartSectionData(
                  value: inProgressCount / totalSum,
                  title:
                      '${(inProgressCount / totalSum * 100).toStringAsFixed(1)}%',
                  color: Colors.orange,
                  titleStyle: TextStyle(fontSize: 12)),
            ],
          ),
        );
      }
      // {
      //   return SfCircularChart(
      //       margin: EdgeInsets.all(10),
      //       series: <CircularSeries>[
      //         DoughnutSeries<ChartData, String>(
      //           dataSource: chartData(statsCubit.statisticsModel!.data!),
      //           xValueMapper: (ChartData data, _) => '${data.x}',
      //           yValueMapper: (ChartData data, _) => data.y,
      //           dataLabelMapper: (ChartData data, _) => '${data.size}',
      //           pointColorMapper: (ChartData data, _) => data.color,
      //           dataLabelSettings: DataLabelSettings(isVisible: true),
      //           radius: '120%',
      //           innerRadius: '55%',
      //         )
      //       ]);
      // }
      else if (state == CubitState.loading)
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
