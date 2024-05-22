import 'package:taskaty/core/services/network/base_response/base_response.dart';

import '../../helpers/toast_helper.dart';

void errorHandler(response) {
   {
    BaseResponse baseResponse = BaseResponse.fromJson(response?.data);
    Toast.showErrorToast('${baseResponse.errors.first}');
     if (response?.statusCode == 500) {
    Toast.showErrorToast('serverError');
  }
  // else if (response?.statusCode == 401) {
  //   PreferencesHelper.preferences?.remove('token');
  //   PreferencesHelper.preferences?.remove('keepMeLogged');
  //   AwesomeDialog(context: context,
  //   title: 'unAuthorizedError'.tr(),
  //   desc: 'un authorized description'.tr(),
  //   btnOkText: 'ok'.tr(),
  //   btnCancelText: 'cancel'.tr(),
  //   dialogType: DialogType.error,
  //   btnOkColor: AppColors.primaryColor,
  //   btnOkOnPress: (){
  //     AppNavigation.navigateOffAll(context: context, page: LoginScreen());
  //   }
  //   ).show();
  // }
  else if (response?.statusCode == 404) {
    Toast.showErrorToast('not found');
  }
}}
