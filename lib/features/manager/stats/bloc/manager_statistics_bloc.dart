import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';

import '../../../../core/helpers/toast_helper.dart';
import '../../../../core/services/network/api/network_api.dart';
import '../stats_model.dart';

enum CubitState { initial, loading, error, done, empty }

class ManagerStatisticsCubit extends Cubit<CubitState> {
  StatsModel? statisticsModel;

  ManagerStatisticsCubit() : super(CubitState.initial);

  Future<void> getManagerStatistics() async {
    emit(CubitState.loading);
    Response? response = await DioHelper.getData(url: Api.statistics);
    if (response?.statusCode == 200) {
      statisticsModel = StatsModel.fromJson(response?.data);
      emit(CubitState.done);
    } else {
      emit(CubitState.error);
      Toast.showErrorToast('Error getting manager stats');
    }
  }
}
