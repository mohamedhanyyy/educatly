import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/router/app_router.dart';
import '../../../config/router/app_router_keys.dart';
import 'local_notification.dart';

class FirebaseCustomNotification {
  static final messaging = FirebaseMessaging.instance;

  static NotificationSettings? settings;

  static Future<void> firebaseMessagingAppOpen() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message.data);
      final route = message.data['Route'];
      final id = message.data['TaskId'];
      debugPrint(route);
      print(id);
      if (route == '/managerTaskDetails') {
        AppRouter.router.pushNamed('$route',
            queryParameters: {AppRouterKeys.managerTaskDetails: id});
      } else {
        AppRouter.router.pushNamed('$route',
            queryParameters: {AppRouterKeys.adminTaskDetails: id});
      }
    });
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // CustomLocalNotification.showFlutterNotification;
  }

  static Future<bool> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission();

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> setUpFirebase() async {
    bool notificationStatus = await requestNotificationPermission();
    if (notificationStatus) {
      await CustomLocalNotification.setupLocalNotifications();
      FirebaseMessaging.onBackgroundMessage(
          FirebaseCustomNotification.firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage
          .listen(CustomLocalNotification.showFlutterNotification);
      FirebaseMessaging.onMessageOpenedApp
          .listen((CustomLocalNotification.onMessageOpenedApp));
    }
  }
}
