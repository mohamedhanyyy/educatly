import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  DioHelper.init();
  await PreferencesHelper.init();
  await Firebase.initializeApp();
  // final loginTime = DateTime.parse(PreferencesHelper.getLoginDate!);
  // final duration = loginTime.difference(DateTime.now());
  // debugPrint('Diffrence date: ${duration.inDays}');
  debugPrint(PreferencesHelper.getToken);
  debugPrint('${await FirebaseMessaging.instance.getToken()}');
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

//{"email":"superadmin@domain.com","password":"P@ssword123"}
//{"email":"basicuser@domain.com","password":"P@ssword123"}
