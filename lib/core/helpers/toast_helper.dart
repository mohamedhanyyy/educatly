import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';

class Toast {
  static showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }

  static showToast(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color ?? AppColors.colors.primary,
    );
  }

  static showErrorToast(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
  }

  static showSuccessToast(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.green);
  }
}
