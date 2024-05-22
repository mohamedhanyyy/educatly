import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';

import '../../../../../core/services/dio_helper/dio_helper.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../../manager/stats/stats_model.dart';

class AdminStatsticsCubit extends Cubit<CubitState> {
  AdminStatsticsCubit() : super(CubitState.initial);
  StatsModel? statisticsModel;

  Future<void> getStats() async {
    emit(CubitState.loading);
    Response? response = await DioHelper.getData(url: Api.statistics);

    if (response?.statusCode == 200) {
      statisticsModel = StatsModel.fromJson(response?.data);
      emit(CubitState.done);
    } else {
      emit(CubitState.error);
    }
  }
}
