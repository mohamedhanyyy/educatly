import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/features/shared/auth/login/data/model/auth_response.dart';

import '../../../../config/l10n/generated/l10n.dart';
import '../../../../config/theme/sizes_manager.dart';
import '../../../../config/theme/widget_manager.dart';
import '../../../../core/services/validation/validation_service.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../controller/avatar_controller.dart';
import '../controller/settings_controller.dart';
import 'edit_avatar.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  final AuthResponse user;

  const EditProfileForm({super.key, required this.user});

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  static final Key buttonKey = UniqueKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.fullName);
    _emailController = TextEditingController(text: widget.user.email);
  }

  bool _canUpdate() {
    return _nameController.text.trim() != widget.user.userName ||
        _emailController.text.trim() != widget.user.email;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          // ? Avatar
          EditAvatarWidget().paddingSymmetric(vertical: AppSizes.size20.h),
          // ? Name
          CustomTextInputField(
            label: S().name,
            controller: _nameController,
            onChanged: (value) => setState(() => _canUpdate()),
            validator: (value) => ValidationService.nameValidation(value),
          ),
          // ? Email
          CustomTextInputField(
            label: S().email,
            // isDisabled: true,
            controller: _emailController,
          ).paddingSymmetric(vertical: AppSizes.size20.h),
          // ? Mobile

          AppSizes.size20.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              return AppDefaultButton(
                key: buttonKey,
                text: S().update,
                width: ScreenUtil().screenWidth,
                onPressed: _canUpdate()
                    ? () async {
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(settingsControllerProvider.notifier)
                              .updateProfile(
                                key: buttonKey,
                                avatar: ref.watch(avatarControllerProvider),
                                userName: _nameController.text.trim() !=
                                        widget.user.fullName
                                    ? _nameController.text.trim()
                                    : null,
                                email: _emailController.text.trim() !=
                                        widget.user.email
                                    ? _emailController.text.trim()
                                    : null,
                              );
                        }
                      }
                    : null,
              );
            },
          ),
        ],
      ).horizontalScreenPadding,
    );
  }
}