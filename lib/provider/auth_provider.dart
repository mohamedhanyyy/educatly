import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskaty/screens/chats_screen.dart';
import 'package:taskaty/service/firebase/firebase_firestore_service.dart';
import 'package:taskaty/service/navigation/navigation.dart';
import 'package:taskaty/shared/constants.dart';

import '../service/notifications/notification_service.dart';
import '../shared/themes/custom_snack_bar.dart';

class AuthintcationProvider with ChangeNotifier {

  static final notifications=NotificationsService();
  bool isLoadingLogin = false;
  bool isLoadingRegister = false;
  Future<void> login(String email, String password) async {
    isLoadingLogin = true;
    notifyListeners();
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (user.user?.uid != null) {
        AppNavigation.navigateOffAll(const ChatsScreen());
        FirebaseFirestoreService.updateUserData({
          'lastActive': DateTime.now(),
          // 'isOnline': true,
        });
        //secure storage
        final storage = const FlutterSecureStorage();
        await storage.write(
            key: AppConstants.refreshToken, value: user.user?.refreshToken);
        await notifications.requestPermission();
        await notifications.getToken();

      }
    } catch (e) {
      debugPrint('$e');
      CustomSnackBars.showErrorToast(title: 'Failed authentication');
    }
    isLoadingLogin = false;
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    isLoadingRegister = true;
    notifyListeners();
    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (user.user?.uid != null) {
        //add user to collection users

        await FirebaseFirestoreService.createUser(
            name: name, email: email, uid: user.user!.uid);
        await notifications.requestPermission();
        await notifications.getToken();

        AppNavigation.navigateOffAll(const ChatsScreen());

        //secure storage
        final storage = const FlutterSecureStorage();
        await storage.write(
            key: AppConstants.refreshToken, value: user.user?.refreshToken);
      }
    } catch (e) {
      debugPrint('$e');
      // CustomSnackBars.showErrorToast(title: 'Failed register');
    }
    isLoadingRegister = false;
    notifyListeners();
  }
}
