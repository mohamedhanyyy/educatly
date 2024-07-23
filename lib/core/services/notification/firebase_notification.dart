import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification.dart';

class FirebaseCustomNotification {
  static final messaging = FirebaseMessaging.instance;

  static NotificationSettings? settings;

  // static Future<void> firebaseMessagingAppOpen() async {
  //   FirebaseMessaging.onMessageOpenedApp
  //       .listen((RemoteMessage message) async {});
  // }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // log('firebaseMessagingBackgroundHandler');
  }

  static Future<bool> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission();

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  static Future<void> setUpFirebase() async {
    bool notificationStatus = await requestNotificationPermission();
    if (notificationStatus) {
      await CustomLocalNotification.init();
      FirebaseMessaging.onBackgroundMessage(
          FirebaseCustomNotification.firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage.listen((e) {
        CustomLocalNotification.showLocalNotification(
            Random().nextInt(10), 'title', 'body', '${e.data}');
      });
      FirebaseMessaging.onMessageOpenedApp.listen((e) {
        CustomLocalNotification.handleLocalNotificationTap('${e.data}');
      });
    }
  }
}
