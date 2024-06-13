import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../config/router/app_router.dart';
import '../../../config/router/app_router_keys.dart';

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class CustomLocalNotification {
  static late AndroidNotificationChannel channel;

  static bool isFlutterLocalNotificationsInitialized = false;

  static Future<void> setupLocalNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    isFlutterLocalNotificationsInitialized = true;
  }

  static void showFlutterNotification(RemoteMessage message) {
    if (message.notification != null && message.notification?.android != null) {
      flutterLocalNotificationsPlugin.show(
        message.notification.hashCode,
        message.notification?.title,
        message.notification?.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/launcher_icon',
          ),
        ),
      );
    }
  }

  static void onMessageOpenedApp(RemoteMessage message) {
    print(message.data);
    final route = message.data['Route'];
    final id = message.data['TaskId'];
    print(route);
    print(id);
    if (route == '/managerTaskDetails') {
      AppRouter.router.pushNamed('$route',
          queryParameters: {AppRouterKeys.managerTaskDetails: id});
    } else {
      AppRouter.router.pushNamed('$route',
          queryParameters: {AppRouterKeys.adminTaskDetails: id});
    }
  }
}
