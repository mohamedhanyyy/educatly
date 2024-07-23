import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../config/router/app_router.dart';
import '../../../config/router/app_router_keys.dart';

class CustomLocalNotification {
  static final CustomLocalNotification _instance =
      CustomLocalNotification._internal();

  factory CustomLocalNotification() {
    return _instance;
  }

  CustomLocalNotification._internal();

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (respone) {
        handleLocalNotificationTap(respone.payload);
      },
    );
  }

  static Future<void> showLocalNotification(
      int id, String title, String body, String payload) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  static Future<void> handleLocalNotificationTap(String? payload) async {
    if (payload != null) {
      RegExp taskIdRegExp = RegExp(r'TaskId: (\d+)');
      final id = taskIdRegExp.firstMatch(payload)?.group(1);

      RegExp routeRegExp = RegExp(r'Route: ([^,}]+)');
      String? route = routeRegExp.firstMatch(payload)?.group(1);

      // // Print the results
      // print('TaskId: $id');
      // print('Route: $route');
      if (route == '/managerTaskDetails') {
        AppRouter.router.pushNamed(route!,
            queryParameters: {AppRouterKeys.managerTaskDetails: id});
      } else {
        AppRouter.router.pushNamed(route!,
            queryParameters: {AppRouterKeys.adminTaskDetails: id});
      }
    }
  }
}
