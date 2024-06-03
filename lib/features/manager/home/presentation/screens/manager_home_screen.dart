import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taskaty/config/router/app_routing_paths.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/core/constants/assets.dart';
import 'package:taskaty/core/controllers/theme/theme_controller.dart';
import 'package:taskaty/core/services/database/preferences_helper.dart';

import '../../../../../config/router/app_router.dart';

class ManagerHomeScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  ManagerHomeScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  int index = 0;

  void _goBranch(int index) {
    this.index = index;
    setState(() {});
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 6, top: 6),
        child: Container(
          height: 80,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return Container(
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 45),
                    decoration: BoxDecoration(
                      color:
                          ref.watch(themeControllerProvider) == ThemeMode.dark
                              ? Theme.of(context).listTileTheme.tileColor
                              : AppColors.colors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _goBranch(0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.home_outlined,
                                color: Colors.white,
                                size: index == 0 ? 35 : 28,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _goBranch(1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.settings,
                                size: index == 1 ? 35 : 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 4,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: AppColors.colors.primary,
                        onPressed: () {
                          if (PreferencesHelper.getUserModel?.role ==
                              'Manager') {
                            AppRouter.router.pushNamed(AppRoutes.managerTasks);
                          } else {
                            AppRouter.router.pushNamed(AppRoutes.addTask);
                          }
                        },
                        child: SvgPicture.asset(
                            PreferencesHelper.getUserModel?.role == 'Manager'
                                ? Assets.icons.managerTasks
                                : Assets.icons.floatingAdd)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}