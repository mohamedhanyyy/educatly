import 'package:go_router/go_router.dart';

import 'app_router.dart';
import 'app_router_keys.dart';
import 'app_routing_paths.dart';

extension AppRouterNavigator on GoRouter {
  pushOtpScreen({required String email}) {
    AppRouter.router.pushNamed(
      AppRoutes.otp,
      queryParameters: {AppRouterKeys.email: email},
    );
  }

  pushTaskScreen({required String managerTaskDetails}) {
    AppRouter.router.pushNamed(
      AppRoutes.managerTaskDetails,
      queryParameters: {AppRouterKeys.managerTaskDetails: managerTaskDetails},
    );
  }

  pushResetPasswordScreen({
    required String email,
    required String resetToken,
  }) {
    AppRouter.router.pushReplacementNamed(
      AppRoutes.resetPassword,
      queryParameters: {
        AppRouterKeys.email: email,
        AppRouterKeys.resetToken: resetToken,
      },
    );
  }
}
