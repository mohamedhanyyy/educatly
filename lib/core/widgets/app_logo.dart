import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends ConsumerWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.asset(
      'assets/images/applogo.png',
      width: 326.w,
      height: 71.h,
    );
  }
}
