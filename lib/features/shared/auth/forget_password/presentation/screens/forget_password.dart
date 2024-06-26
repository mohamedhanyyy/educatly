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
import '../../../../../../core/widgets/custom_text_field.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  static final buttonKey = UniqueKey();
  TextEditingController mailController = TextEditingController();
  static final GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().forgot_password)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    Assets.icons.forgetPassword,
                  ),
                ),
              ),
              AppSizes.size20.verticalSpace,
              Text(
                S().forgot_password,
                style: StylesManager.bold(
                  fontSize: AppFonts.font.xXXLarge.sp,
                ),
              ),
              AppSizes.size16.verticalSpace,
              Text(
                S().forget_description,
                textAlign: TextAlign.center,
                style: StylesManager.medium(
                  fontSize: AppFonts.font.large.sp,
                ),
              ),
              AppSizes.size20.verticalSpace,
              Form(
                key: forgetPasswordKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    CustomTextInputField(
                      label: S().email,
                      controller: mailController,
                      type: TextInputType.emailAddress,
                      validator: (value) =>
                          ValidationService.emailValidation(value),
                    ),
                    AppSizes.size20.verticalSpace,
                    Consumer(
                      builder: (_, ref, __) {
                        return AppDefaultButton(
                          key: buttonKey,
                          text: S().send,
                          width: ScreenUtil().screenWidth,
                          onPressed: () async {
                            if (forgetPasswordKey.currentState!.validate()) {
                              await ref
                                  .read(
                                      forgetPasswordControllerProvider.notifier)
                                  .forgetPassword(
                                    key: buttonKey,
                                    email: mailController.text,
                                  );
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ).horizontalScreenPadding,
            ],
          ),
        ),
      ),
    );
  }
}
