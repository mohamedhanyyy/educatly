import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskaty/features/admin/edit_task/presentation/screens/edit_task_screen.dart';
import 'package:taskaty/features/admin/home/presentation/screens/admin_home_screen.dart';
import 'package:taskaty/features/admin/home/presentation/screens/admin_main_screen.dart';
import 'package:taskaty/features/admin/task_details/presentation/screens/admin_task_details.dart';
import 'package:taskaty/features/admin/tasks/presentation/screens/admin_tasks_screen.dart';
import 'package:taskaty/features/manager/home/presentation/screens/manager_home_screen.dart';
import 'package:taskaty/features/manager/tasks/presentation/screens/manager_tasks.dart';

import '../../core/services/database/preferences_helper.dart';
import '../../features/admin/add_task/presentation/screens/add_task.dart';
import '../../features/admin/add_user/presentation/screens/admin_screen.dart';
import '../../features/admin/add_user/presentation/screens/super_admin_screen.dart';
import '../../features/admin/company/presentation/screens/add_company_screen.dart';
import '../../features/admin/company/presentation/screens/get_companies_screen.dart';
import '../../features/admin/get_managers/presentation/screens/managers_screen.dart';
import '../../features/manager/home/presentation/screens/manager_main_screen.dart';
import '../../features/manager/tasks/presentation/screens/manager_task_details.dart';
import '../../features/settings/presentation/screens/change_password.dart';
import '../../features/settings/presentation/screens/edit_profile.dart';
import '../../features/settings/presentation/screens/privacy_policy.dart';
import '../../features/settings/presentation/screens/settings.dart';
import '../../features/shared/auth/create_password/presentation/screens/create_password.dart';
import '../../features/shared/auth/forget_password/presentation/screens/forget_password.dart';
import '../../features/shared/auth/login/presentation/screens/login.dart';
import '../../features/shared/auth/otp/presentation/screens/otp.dart';
import '../../features/shared/auth/reset_password/presentation/screens/reset_password.dart';
import '../../features/shared/notifications/presentation/screen/notification.dart';
import '../../features/shared/splash/presentation/screens/splash.dart';
import 'app_router_keys.dart';
import 'app_routing_paths.dart';

DateTime loginTime = DateTime.parse(PreferencesHelper.getLoginDate!);
Duration duration = loginTime.difference(DateTime.now());

class AppRouter {
  AppRouter._();

  static final navigatorState = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorState,
    debugLogDiagnostics: kDebugMode,
    initialLocation: PreferencesHelper.getToken == null || duration.inDays <= 0
        ? AppRoutes.login
        : PreferencesHelper.getUserModel?.role == 'SystemAdmin'
            ? AppRoutes.adminHome
            : AppRoutes.managerHome,
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Not Found'))),
    routes: [
      ///? Splash
      GoRoute(
        name: AppRoutes.splash,
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.testGetCompany,
        path: AppRoutes.testGetCompany,
        builder: (context, state) => GetCompaniesScreen(),
      ),

      ///? Login
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),

      ///? Manager tasks
      GoRoute(
        name: AppRoutes.managerTasks,
        path: AppRoutes.managerTasks,
        builder: (context, state) => ManagerTasksScreen(),
      ),

      ///? Forget Password
      GoRoute(
        name: AppRoutes.forgetPassword,
        path: AppRoutes.forgetPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),

      ///? OTP
      GoRoute(
        name: AppRoutes.otp,
        path: AppRoutes.otp,
        builder: (context, state) => OTPScreen(
          email: state.uri.queryParameters[AppRouterKeys.email] ?? '',
        ),
      ),

      ///? Reset Password
      GoRoute(
        name: AppRoutes.resetPassword,
        path: AppRoutes.resetPassword,
        builder: (context, state) => ResetPasswordScreen(
          email: state.uri.queryParameters[AppRouterKeys.email] ?? '',
          resetToken: state.uri.queryParameters[AppRouterKeys.resetToken] ?? '',
        ),
      ),

      ///? Edit Profile
      GoRoute(
        path: AppRoutes.editProfile,
        name: AppRoutes.editProfile,
        builder: (context, state) => EditProfileScreen(),
      ),

      ///? Admin
      GoRoute(
        path: AppRoutes.admin,
        name: AppRoutes.admin,
        builder: (context, state) => AdminScreen(),
      ),

      ///? Super Admin
      GoRoute(
        path: AppRoutes.addUserSuperAdmin,
        name: AppRoutes.addUserSuperAdmin,
        builder: (context, state) => SuperAdminScreen(),
      ),

      ///? Change Password
      GoRoute(
        path: AppRoutes.changePassword,
        name: AppRoutes.changePassword,
        builder: (context, state) => ChangePasswordScreen(),
      ),

      /// Add Task
      GoRoute(
        path: AppRoutes.addTask,
        name: AppRoutes.addTask,
        builder: (context, state) => AddTaskScreen(),
      ),

      ///? Create Password
      GoRoute(
        path: AppRoutes.createPassword,
        name: AppRoutes.createPassword,
        builder: (context, state) => CreatePasswordScreen(),
      ),

      ///? Privacy Policy
      GoRoute(
        path: AppRoutes.privacyPolicy,
        name: AppRoutes.privacyPolicy,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),

      ///? Notifications
      GoRoute(
        path: AppRoutes.notifications,
        name: AppRoutes.notifications,
        builder: (context, state) => NotificationScreen(),
      ),

      ///? Task
      GoRoute(
        path: AppRoutes.managerTaskDetails,
        name: AppRoutes.managerTaskDetails,
        builder: (context, state) => ManagerTaskDetailsScreen(
            managerTaskDetails:
                (state.uri.queryParameters[AppRouterKeys.managerTaskDetails]!)),
      ),

      ///? Add Company
      GoRoute(
        path: AppRoutes.addCompany,
        name: AppRoutes.addCompany,
        builder: (context, state) => const AddCompanyScreen(),
      ),

      ///? Admin Tasks
      GoRoute(
        path: AppRoutes.adminTasks,
        name: AppRoutes.adminTasks,
        builder: (context, state) => const AdminTasksScreen(),
      ),

      ///? Admin Tasks
      GoRoute(
        path: AppRoutes.getManagers,
        name: AppRoutes.getManagers,
        builder: (context, state) => GetManagersScreen(),
      ),

      ///? Edit Task
      GoRoute(
          path: AppRoutes.editTask,
          name: AppRoutes.editTask,
          builder: (context, state) => EditTaskScreen(
              editTaskId: state.uri.queryParameters[AppRouterKeys.editTask]!)),
      GoRoute(
          path: AppRoutes.taskaDetails,
          name: AppRoutes.taskaDetails,
          builder: (context, state) => AdminTaskDetailsScreen(
              task: state.uri.queryParameters[AppRouterKeys.taskaDetails]!)),

      ///? Main
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) {
          return ManagerHomeScreen(navigationShell: navigationShell);
        },
        branches: [
          ///? Home
          StatefulShellBranch(
            initialLocation: AppRoutes.managerHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.managerHome,
                name: AppRoutes.managerHome,
                builder: (context, state) => ManagerMainScreen(),
              ),
            ],
          ),

          ///? Settings
          StatefulShellBranch(
            initialLocation: AppRoutes.settings,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.settings,
                name: AppRoutes.settings,
                builder: (context, state) => SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) {
          return AdminHomeScreen(navigationShell: navigationShell);
        },
        branches: [
          ///? Home
          StatefulShellBranch(
            initialLocation: AppRoutes.adminHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.adminHome,
                name: AppRoutes.adminHome,
                builder: (context, state) => AdminMainScreen(),
              ),
            ],
          ),

          ///? Settings
          StatefulShellBranch(
            initialLocation: AppRoutes.admin2,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.admin2,
                name: AppRoutes.admin2,
                builder: (context, state) => SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
