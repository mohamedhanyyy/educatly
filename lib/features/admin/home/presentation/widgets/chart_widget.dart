import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
        return SfCircularChart(
            margin: EdgeInsets.all(10),
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: chartData(statsCubit.statisticsModel!.data!),
                xValueMapper: (ChartData data, _) => '${data.x}',
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelMapper: (ChartData data, _) => '${data.size}',
                pointColorMapper: (ChartData data, _) => data.color,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                radius: '120%',
                //todo
                animationDelay: 0,
                //todo
                animationDuration: 0,
                innerRadius: '55%',
                explodeAll: false,
                explode: false,
              )
            ]);
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
      ChartData(model.taskNewCount!, model.taskNewCount!,
          '${model.taskNewCount}%', Color(0xff14BBD8)),
      ChartData(
          model.taskInProgressCount == 0 ? 2 : model.taskInProgressCount,
          model.taskInProgressCount == 0 ? 2 : model.taskInProgressCount,
          '${model.taskInProgressCount}%',
          Colors.orange),
      ChartData(model.taskCompleteCount, model.taskCompleteCount,
          '${model.taskCompleteCount}%', AppColors.colors.green),
    ];
