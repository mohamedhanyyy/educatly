import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:taskaty/config/router/app_routing_paths.dart';

import '../../../config/router/app_router.dart';
import 'local_notification.dart';

class FirebaseCustomNotification {
  static final messaging = FirebaseMessaging.instance;

  static NotificationSettings? settings;

  static Future<void> firebaseMessagingAppOpen() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      AppRouter.router.push(AppRoutes.resetPassword);
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
