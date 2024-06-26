import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../core/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Timer(
      const Duration(seconds: 3),
      () async {
        final auth = await PreferencesHelper.getUserModel;
        auth != null
            ? AppRouter.router.go(AppRoutes.settings)
            : AppRouter.router.go(AppRoutes.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: AppLogo()));
  }
}
