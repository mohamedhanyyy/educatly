import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/router/app_router.dart';
import '../../../../../config/router/app_routing_paths.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/controllers/theme/theme_controller.dart';

class AdminHomeScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  AdminHomeScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar2'));

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int index = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseCustomNotification.setUpFirebase();
  // }

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
    return SafeArea(
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 6, top: 6),
          child: Container(
            height: 80,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return Container(
                      height: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 45),
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
                                  size: index == 0 ? 35 : 25,
                                  color: Colors.white,
                                  // height: index == 0 ? 25 : 20,
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
                                child: SvgPicture.asset(
                                  Assets.icons.setting,
                                  width: index == 1 ? 28 : 23,
                                  height: index == 1 ? 28 : 23,
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
                    margin: const EdgeInsets.only(bottom: 10),
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: AppColors.colors.primary,
                          onPressed: () =>
                              AppRouter.router.pushNamed(AppRoutes.addTask),
                          child: SvgPicture.asset(Assets.icons.floatingAdd)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
