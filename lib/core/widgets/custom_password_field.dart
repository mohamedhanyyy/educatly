import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_system/app_colors.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/styles_manager.dart';
import '../../config/theme/color_system/color_system_light.dart';
import '../../config/theme/font_system/app_fonts.dart';
import '../constants/constants.dart';

class CustomPasswordInputField extends StatefulWidget {
  final String label;
  final FormFieldValidator? validator;
  final ValueChanged<String?>? onChanged;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  const CustomPasswordInputField({
    Key? key,
    this.validator,
    this.onChanged,
    required this.label,
    required this.controller,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  State<CustomPasswordInputField> createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: AppConstants.defaultBorderRadius,
      child: TextFormField(
        autofocus: false,
        obscureText: _isHidden,
        validator: widget.validator,
        onChanged: widget.onChanged,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        autofillHints: const [AutofillHints.password],
        strutStyle: const StrutStyle(forceStrutHeight: true),
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: StylesManager.medium(
          fontSize: AppFonts.font.large.sp,
        ),
        decoration: InputDecoration(
          hintStyle: StylesManager.regular(
              fontSize: AppSizes.size12,
              color: Theme.of(context).secondaryHeaderColor),
          labelStyle: StylesManager.regular(
              fontSize: AppSizes.size12, color: ColorSystemLight().black2),
          errorStyle: StylesManager.regular(
            fontSize: AppSizes.size12.sp,
          ),
          hintText: '',
          labelText: widget.label,
          suffixIcon: InkWell(
            focusNode: FocusNode(skipTraversal: true),
            onTap: () => setState(() => _isHidden = !_isHidden),
            child: Icon(
              size: AppSizes.size20.sp,
              color: _isHidden ? Colors.grey : AppColors.colors.primary,
              _isHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ),
      ),
    );
  }
}
