import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requests_inspector/requests_inspector.dart';
import 'package:taskaty/taskaty.dart';

import 'core/services/database/preferences_helper.dart';
import 'core/services/dio_helper/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DateTime nowTime = DateTime.now();

  DioHelper.init();
  await PreferencesHelper.init();
  DateTime loginTime = (DateTime.parse(PreferencesHelper.getLoginDate!));
  print(nowTime);
  print(loginTime);
  Duration duration = nowTime.difference(loginTime);
  print(duration.inDays);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    ProviderScope(
      child: RequestsInspector(
        child: Taskaty(),
        enabled: kDebugMode,
        showInspectorOn: ShowInspectorOn.Both,
        navigatorKey: null,
        hideInspectorBanner: true,
      ),
    ),
  );
}

refreshToken() async {
  Response? response = await DioHelper.getData(url: 'url');
  if (response?.data['date']) {
    PreferencesHelper.saveToken(token: response?.data['token']);
  }
}

//   "email": "superadmin@domain.com",
//   "email": "basicuser@domain.com",
//   "password": "P@ssword123"

//{  "email": "superadmin1@domain.com","password": "P@ssword123"}
