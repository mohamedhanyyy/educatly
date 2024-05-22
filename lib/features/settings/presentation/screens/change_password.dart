import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/widgets/custom_text_field.dart';

import '../../../../config/l10n/generated/l10n.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/widget_manager.dart';
import '../../../../core/services/validation/validation_service.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_password_field.dart';
import '../controller/settings_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  static final Key buttonKey = UniqueKey();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController currentPass = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController confirmNewPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().change_password)),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextInputField(
              label: S().name,
              controller: name,
              textInputAction: TextInputAction.next,
              validator: (value) => ValidationService.notEmptyField(value),
            ),
            CustomPasswordInputField(
              label: S().current_password,
              controller: currentPass,
              textInputAction: TextInputAction.next,
              validator: (value) => ValidationService.validatePassword(value),
            ).paddingOnly(top: AppSizes.size10.h),
            CustomPasswordInputField(
              label: S().new_password,
              controller: newPass,
              textInputAction: TextInputAction.next,
              validator: (value) {
                return ValidationService.validatePassword(value);
              },
            ).paddingSymmetric(vertical: AppSizes.size10.h),
            CustomPasswordInputField(
              label: S().confirm_new_password,
              controller: confirmNewPass,
              textInputAction: TextInputAction.done,
              validator: (value) {
                ValidationService.validatePassword(value);

                if (value.isNotEmpty && (value != newPass.text))
                  return S().password_no_match_new;
                return ValidationService.validatePassword(value);
              },
            ),
            AppSizes.size10.verticalSpace,
            Consumer(
              builder: (context, ref, child) {
                return AppDefaultButton(
                  key: buttonKey,
                  text: S().update,
                  width: ScreenUtil().screenWidth,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await ref
                          .read(settingsControllerProvider.notifier)
                          .changePassword(
                            key: buttonKey,
                            userName: name.text.trim(),
                            newPass: newPass.text.trim(),
                            currentPass: currentPass.text,
                          );
                    }
                  },
                );
              },
            ),
          ],
        ).defaultScreenPadding,
      ),
    );
  }
}
