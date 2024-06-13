import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';
import 'package:taskaty/features/shared/notifications/model/notifications_model.dart';

class NotificationCubit extends Cubit<CubitState> {
  NotificationCubit() : super(CubitState.initial);
  NotificationsModel? notificationsModel;
  Future<void> getUserNotifications() async {
    emit(CubitState.loading);

    final response = await DioHelper.getData(
      url: 'Notification/GetUserNotifications',
      query: {
        "pageNumber": 1,
        "pageSize": 1000,
      },
    );

    if (response?.statusCode == 200) {
      notificationsModel = NotificationsModel.fromJson(response?.data);
      emit(CubitState.done);
    }
  }
}
