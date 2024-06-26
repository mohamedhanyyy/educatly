import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/color_system/app_colors.dart';
import '../../config/theme/sizes_manager.dart';
import '../constants/app_button.dart';
import '../constants/constants.dart';
import '../controllers/button/button_controller.dart';

class AppDefaultButton extends ConsumerWidget {
  final String? text;
  final Widget? child;
  final double? width;
  final double? radius;
  final double? borderRadius;
  final bool? isBordered;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final Color? borderColor;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Function()? onPressed;

  const AppDefaultButton({
    Key? key,
    this.text,
    this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.textStyle,
    this.textColor,
    this.isBordered,
    this.radius = 10,
    this.borderColor,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ButtonStatus _status = ref.watch(buttonControllerProvider).key == key
        ? ref.watch(buttonControllerProvider).status
        : ButtonStatus.initial;
    return Container(
      height: height ?? AppSizes.size50.h,
      width: width ?? ScreenUtil().screenWidth,
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: AppButtonConstants.getButtonColor(
            buttonStatus: _status,
            color: backgroundColor,
          ),
          backgroundColor: AppButtonConstants.getButtonColor(
            buttonStatus: _status,
            color: backgroundColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: radius != null
                ? BorderRadius.circular(radius!)
                : AppConstants.defaultBorderRadius,
            side: !(isBordered ?? false)
                ? BorderSide.none
                : BorderSide(
                    width: borderRadius ?? 1.sp,
                    color: borderColor ?? textColor ?? AppColors.colors.primary,
                  ),
          ),
        ),
        child: AppButtonConstants.getButtonWidget(
          title: text,
          widget: child,
          fontSize: fontSize,
          textColor: textColor,
          textStyle: textStyle,
          buttonStatus: _status,
          iconColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: AppButtonConstants.getButtonAction(
          buttonStatus: _status,
          function: onPressed,
        ),
      ),
    );
  }
}

class AppLoadingButton extends StatelessWidget {
  const AppLoadingButton({super.key});

  Widget build(context) {
    return Container(
      height: AppSizes.size50.h,
      width: ScreenUtil().screenWidth,
      child: ElevatedButton(
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: AppColors.colors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: AppConstants.defaultBorderRadius,
              side: BorderSide(
                width: 1.sp,
                color: AppColors.colors.primary,
              )),
        ),
        onPressed: () {},
        child: Center(
            child: CircularProgressIndicator.adaptive(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        )),
      ),
    );
  }
}
