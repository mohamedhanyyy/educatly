import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/assets.dart';
import '../../../../../../core/services/validation/validation_service.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/custom_password_field.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  final String resetToken;

  ResetPasswordScreen({
    super.key,
    required this.email,
    required this.resetToken,
  });

  static final buttonKey = UniqueKey();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().create_new_password)),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: 120.h,
                height: 120.h,
                padding: EdgeInsets.all(25.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colors.primary,
                  border: Border.all(
                    width: AppSizes.size10.h,
                    color: const Color(0xffF8F8F8),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.icons.password,
                  ),
                ),
              ),
              AppSizes.size20.verticalSpace,
              Text(
                S().create_new_password,
                style: StylesManager.bold(
                  fontSize: AppFonts.font.xXXLarge.sp,
                ),
              ),
              AppSizes.size16.verticalSpace,
              Text(
                S().create_new_password_desc,
                textAlign: TextAlign.center,
                style: StylesManager.semiBold(
                  fontSize: AppFonts.font.small.sp,
                ),
              ),
              AppSizes.size20.verticalSpace,
              CustomPasswordInputField(
                label: S().new_password,
                controller: password,
                textInputAction: TextInputAction.next,
                validator: (value) => ValidationService.validatePassword(value),
              ),
              AppSizes.size20.verticalSpace,
              CustomPasswordInputField(
                label: S().confirm_new_password,
                controller: confirmPassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value != password.text) {
                    return S().password_no_match_new;
                  }
                  return ValidationService.validatePassword(value);
                },
              ),
              AppSizes.size20.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  return AppDefaultButton(
                    key: buttonKey,
                    text: S().update_password,
                    width: ScreenUtil().screenWidth,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        ref
                            .read(resetPasswordControllerProvider.notifier)
                            .resetPassword(
                              key: buttonKey,
                              email: email,
                              password: password.text,
                              resetPasswordToken: resetToken,
                              confirmPassword: confirmPassword.text,
                            );
                      }
                    },
                  );
                },
              ),
            ],
          ).horizontalScreenPadding,
        ),
      ),
    );
  }
}
