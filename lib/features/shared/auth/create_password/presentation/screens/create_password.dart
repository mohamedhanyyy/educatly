import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/widget_manager.dart';
import 'package:taskaty/core/widgets/custom_password_field.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/assets.dart';
import '../../../../../../core/services/validation/validation_service.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../controller/create_password_controller.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  static final buttonKey = UniqueKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();
  static final GlobalKey<FormState> createPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.h),
                width: 120.h,
                height: 120.h,
                padding: EdgeInsets.all(25.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colors.primary,
                  border: Border.all(
                    width: AppSizes.size10.h,
                    color: Color(0xffF8F8F8),
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
                style: StylesManager.medium(
                  fontSize: AppFonts.font.large.sp,
                ),
              ),
              AppSizes.size20.verticalSpace,
              Form(
                key: createPasswordKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    // CustomTextInputField(),
                    //   label: S().name,
                    //   maxLength: 15,
                    //   controller: nameController,
                    //   type: TextInputType.name,
                    //   validator: (value) =>
                    //       ValidationService.nameValidation(value),
                    // ),
                    AppSizes.size10.verticalSpace,
                    CustomPasswordInputField(
                      label: S().old_password,
                      controller: oldPasswordController,
                      validator: (value) =>
                          ValidationService.validatePassword(value),
                    ),
                    AppSizes.size10.verticalSpace,
                    CustomPasswordInputField(
                      label: S().password_confirmation,
                      controller: newPasswordController,
                      validator: (value) =>
                          ValidationService.validatePassword(value),
                    ),
                    AppSizes.size20.verticalSpace,
                    CustomPasswordInputField(
                      label: S().new_password_confirm,
                      controller: newPasswordConfirmController,
                      validator: (value) =>
                          ValidationService.validatePassword(value),
                    ),
                    AppSizes.size20.verticalSpace,
                    Consumer(
                      builder: (_, ref, __) {
                        return AppDefaultButton(
                          key: buttonKey,
                          text: S().send,
                          width: ScreenUtil().screenWidth,
                          onPressed: () async {
                            if (createPasswordKey.currentState!.validate()) {
                              await ref
                                  .read(
                                      createPasswordControllerProvider.notifier)
                                  .createPassword(
                                    key: buttonKey,
                                    email: nameController.text,
                                    oldPassword: oldPasswordController.text,
                                    newPassword: newPasswordController.text,
                                    newPasswordConfirm:
                                        newPasswordConfirmController.text,
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
