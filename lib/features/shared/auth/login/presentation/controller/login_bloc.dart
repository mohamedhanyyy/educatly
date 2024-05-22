import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/manager/stats/bloc/manager_statistics_bloc.dart';
import 'package:taskaty/features/shared/auth/login/presentation/controller/login_model.dart';

import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../../core/helpers/toast_helper.dart';
import '../../../../../../core/services/network/api/network_api.dart';

class LoginCubit extends Cubit<CubitState> {
  LoginCubit() : super(CubitState.initial);

  LoginModel? loginModel;

  Future<void> login(
      {required String email,
      required String password,
      required Key key,
      required WidgetRef ref}) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    Response? response = await DioHelper.postData(url: Api.login, data: {
      "email": email,
      "password": password,
    });
    loginModel = LoginModel.fromJson(response?.data);
    if (response?.statusCode == 200) {
      emit(CubitState.done);
      PreferencesHelper.saveUserModel(userModel: loginModel!.data!);
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);

      if (loginModel?.data?.firstLogin == true) {
        AppRouter.router.go(AppRoutes.createPassword);
      } else if (loginModel?.data?.role == 'SystemAdmin') {
        AppRouter.router.go(AppRoutes.adminHome);
      } else {
        AppRouter.router.go(AppRoutes.managerHome);
      }
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      Toast.showErrorToast(loginModel?.errors?.first ?? 'login failed');
    }
  }
}
