import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/color_system/color_system_light.dart';
import 'package:taskaty/config/theme/sizes_manager.dart';
import 'package:taskaty/taskaty.dart';

import '../../config/theme/color_system/app_colors.dart';
import '../../config/theme/styles_manager.dart';

class CustomTextInputField extends StatelessWidget {
  final String? label;
  final String? errorText;
  final int? maxLines;
  final int? maxLength;
  final bool isDisabled;
  final bool autoFocus;
  final bool enabled;
  final bool assignLabelWithHint;
  final Color? fillColor;
  final Color? labelColor;
  final EdgeInsets? contentPadding;
  final TextInputType type;
  final FormFieldValidator? validator;
  final TextInputAction textInputAction;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onTapOutside;
  final ValueChanged<String?>? onSubmitted;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final InputBorder? inputBorder;
  final FocusNode? focusNode;
  final InputBorder? errorBorder;

  CustomTextInputField({
    Key? key,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.onChanged,
    this.errorBorder,
    this.inputBorder,
    this.contentPadding,
    this.enabled = true,
    this.validator,
    this.onTapOutside,
    this.onTap,
    this.labelColor,
    this.controller,
    this.assignLabelWithHint = false,
    this.maxLines = 1,
    this.maxLength,
    this.suffix,
    this.prefix,
    this.fillColor,
    required this.label,
    this.autoFocus = false,
    this.isDisabled = false,
    this.type = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxLength,
      enabled: enabled,
      maxLines: maxLines,
      keyboardType: type,
      autofocus: autoFocus,
      readOnly: isDisabled,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
      cursorWidth: 1.5,
      cursorHeight: 22,
      cursorErrorColor: AppColors.colors.primary,
      cursorColor: AppColors.colors.primary,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        counterText: '',
        errorText: null,
        errorBorder: errorBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor)),
        contentPadding: contentPadding,
        border: inputBorder,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        focusedBorder: inputBorder,
        hintStyle: StylesManager.regular(
            fontSize: AppSizes.size12,
            color: labelColor ?? Theme.of(context).secondaryHeaderColor),
        labelStyle: StylesManager.regular(
            fontSize: AppSizes.size12,
            color: labelColor ?? ColorSystemLight().black2),
        errorStyle: StylesManager.regular(
          fontSize: AppSizes.size12.sp,
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
        prefixIconConstraints:
            BoxConstraints(minWidth: 0, minHeight: AppSizes.size55.h),
        prefixIconColor: Theme.of(context).appBarTheme.foregroundColor,
        alignLabelWithHint: assignLabelWithHint,
        suffixIconConstraints: BoxConstraints(
          minWidth: AppSizes.size15.sp,
          minHeight: AppSizes.size15.sp,
        ),
        filled: true,
        labelText: label == '' ? '' : label,
      ),
      strutStyle: const StrutStyle(forceStrutHeight: true),
      onTapOutside: (event) {
        if (onTapOutside != null) {
          onTapOutside!();
        }
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: () {
        unFocusCursorRTL(controller!);
      },
      style: StylesManager.medium(
          fontSize: 15.sp,
          height: 1.7,
          color: labelColor ?? Theme.of(context).appBarTheme.foregroundColor),
    );
  }
}
