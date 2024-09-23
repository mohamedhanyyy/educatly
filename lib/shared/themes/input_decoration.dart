import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration customInputDecoration({
  required String hintText,
  Icon? suffixIcon,
  Icon? prefixIcon,
 }) {
  return InputDecoration(
    counterText: '',
    hintText: hintText,

    hintStyle: const TextStyle(
      color: Colors.black,
      fontSize: 12,
    ),

     border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.greyColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.greyColor),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyColor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyColor)),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),

    filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    suffixIcon: suffixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: suffixIcon,
          )
        : null,
    prefixIcon: prefixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: prefixIcon)
        : null,
  );
}
