import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/screens/login_screen.dart';
import 'package:taskaty/screens/search_screen.dart';
import 'package:taskaty/service/navigation/navigation.dart';

import '../../provider/firebase_provider.dart';
import '../service/firebase/firebase_firestore_service.dart';
import '../service/notifications/notification_service.dart';
import '../shared/themes/colors.dart';
import '../shared/widgets/user_item.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with WidgetsBindingObserver {
  final notificationService=NotificationsService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    notificationService.firebaseNotification(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        FirebaseFirestoreService.updateUserData({
          'lastActive': DateTime.now(),
          'isOnline': true,
        });
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        FirebaseFirestoreService.updateUserData({'isOnline': false});
        break;
      case AppLifecycleState.hidden:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          actions: [
            IconButton(
              onPressed: () =>
                  AppNavigation.navigate(const UsersSearchScreen()),
              icon: const Icon(Icons.search, color: Colors.black),
            ),
            IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                FirebaseFirestoreService.updateUserData({
                  'isOnline': false,
                  'lastActive': DateTime.now(),
                });

                AppNavigation.navigateOffAll(const LoginScreen());

                final storage = const FlutterSecureStorage();
                await storage.deleteAll();
              },
              icon:   const Icon(Icons.logout, color: AppColors.redColor),
            ),
          ],
        ),
        body: Consumer<FirebaseProvider>(builder: (__, value, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: value.users.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                value.users[index].uid != FirebaseAuth.instance.currentUser?.uid
                    ? UserItem(user: value.users[index])
                    : const SizedBox.shrink(),
          );
        }),
      );
}
