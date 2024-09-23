import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/provider/auth_provider.dart';
import 'package:taskaty/provider/firebase_provider.dart';
import 'package:taskaty/screens/chats_screen.dart';
import 'package:taskaty/screens/login_screen.dart';
import 'package:taskaty/service/navigation/navigation.dart';
import 'package:taskaty/shared/themes/datkTheme.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await FirebaseMessaging.instance.getInitialMessage();

  //multi providers
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthintcationProvider()),
    ChangeNotifierProvider(create: (context) => FirebaseProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      locale: const Locale('en'),
      navigatorKey: AppNavigation.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser?.uid == null
          ? const LoginScreen()
          : const ChatsScreen(),
    );
  }
}
