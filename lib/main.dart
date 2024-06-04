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
  // DateTime nowTime = DateTime.now();

  DioHelper.init();
  await PreferencesHelper.init();
  // DateTime loginTime = (DateTime.parse(PreferencesHelper.getLoginDate!));
  // debugPrint('${nowTime}');
  // debugPrint('${loginTime}');
  // debugPrint('${nowTime.difference(loginTime)}');
  debugPrint(PreferencesHelper.getToken);
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

//basicuser
//{"email":"superadmin1@domain.com","password":"P@ssword123"}
