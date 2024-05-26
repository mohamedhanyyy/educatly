import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/features/shared/auth/login/presentation/controller/login_bloc.dart';

import 'config/l10n/generated/l10n.dart';
import 'config/router/app_router.dart';
import 'config/theme/theme_manager.dart';
import 'core/controllers/localization/localization_controller.dart';
import 'core/controllers/theme/theme_controller.dart';
import 'features/admin/home/presentation/bloc/statstics_bloc.dart';
import 'features/admin/tasks/presentation/bloc/get_admin_tasks_bloc.dart';
import 'features/manager/stats/bloc/manager_statistics_bloc.dart';

class Taskaty extends ConsumerWidget {
  const Taskaty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (BuildContext _, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
            BlocProvider<AdminGetTasksBloc>(create: (_) => AdminGetTasksBloc()),
            BlocProvider<AdminStatsticsCubit>(
                create: (_) => AdminStatsticsCubit()),
            BlocProvider<ManagerStatisticsCubit>(
                create: (_) => ManagerStatisticsCubit()),
          ],
          child: MaterialApp.router(
            title: S().app_name,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.getLightMode,
            darkTheme: ThemeManager.getDarkMode,
            themeMode: ref.watch(themeControllerProvider),
            supportedLocales: S.delegate.supportedLocales,
            locale: ref.watch(localizationControllerProvider),
            localizationsDelegates: const [
              S.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}

unFocusCursorRTL(TextEditingController controller) {
  if (controller.selection ==
      TextSelection.fromPosition(
          TextPosition(offset: controller.text.length - 1))) {
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
