import 'package:flutter/material.dart';

import 'colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final Widget? widget;
  final double? padding;
  final Color? color;
  final Color? borderColor;

  const CustomElevatedButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.borderRadius,
    this.fontColor,
    this.widget,
    this.borderColor,
    this.padding,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          elevation: 0,
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.primaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        child: widget ??
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fontColor ?? AppColors.darkBlue,
                fontSize: fontSize ?? 15,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
    );
  }
}

class LoadingElevatedButton extends StatelessWidget {
  final double? borderRadius;
  final Color? fontColor;
  final double? fontSize;
  final Widget? widget;
  final Color? color;
  final Color? borderColor;

  const LoadingElevatedButton({
    super.key,
    this.borderRadius,
    this.fontColor,
    this.widget,
    this.borderColor,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          elevation: 0,
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.primaryColor),
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        child: const CircularProgressIndicator.adaptive());
  }
}
