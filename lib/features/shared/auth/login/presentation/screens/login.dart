import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/router/app_router.dart';
import '../../../../../../config/router/app_routing_paths.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/services/validation/validation_service.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_logo.dart';
import '../../../../../../core/widgets/custom_password_field.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../controller/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final buttonKey = UniqueKey();
  TextEditingController mailController =
      TextEditingController(text: 'basicuser@domain.com');
  TextEditingController passwordController =
      TextEditingController(text: 'P@ssword123');
  static final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late LoginCubit loginCubit = context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: const AppLogo()),
            AppSizes.size20.verticalSpace,
            Text(
              S().welcome,
              style: StylesManager.bold(
                fontSize: AppFonts.font.xXXLarge.sp,
              ),
            ),
            Text(
              S().login_desc,
              style: StylesManager.medium(
                fontSize: AppFonts.font.large.sp,
              ),
            ),
            AppSizes.size50.verticalSpace,
            Form(
              key: loginKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  CustomTextInputField(
                    label: S().email,
                    controller: mailController,
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        ValidationService.emailValidation(value),
                  ),
                  AppSizes.size20.verticalSpace,
                  CustomPasswordInputField(
                    label: S().password,
                    controller: passwordController,
                    validator: (value) =>
                        ValidationService.validatePassword(value),
                  ),
                  AppSizes.size16.verticalSpace,
                  // Forget Password
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                      onTap: () =>
                          AppRouter.router.pushNamed(AppRoutes.forgetPassword),
                      child: Text(
                        S().forgot_password,
                        style: StylesManager.bold(
                          fontSize: AppFonts.font.small.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Consumer(builder: (_, ref, __) {
                      return AppDefaultButton(
                        key: buttonKey,
                        text: S().login,
                        width: ScreenUtil().screenWidth,
                        onPressed: () {
                          if (loginKey.currentState!.validate()) {
                            loginCubit.login(
                              key: buttonKey,
                              ref: ref,
                              email: mailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      );
                    }),
                  ),
                  AppSizes.size50.verticalSpace,
                  // Consumer(
                  //   builder: (_, ref, __) {
                  //     return AppDefaultButton(
                  //       key: buttonKey,
                  //       text: S().login,
                  //       width: ScreenUtil().screenWidth,
                  //       onPressed: () {
                  //         if (loginKey.currentState!.validate()) {
                  //           ref.read(loginControllerProvider.notifier).login(
                  //                 key: buttonKey,
                  //                 email: mailController.text,
                  //                 password: passwordController.text,
                  //               );
                  //         }
                  //       },
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ).horizontalScreenPadding,
      ),
    );
  }
}
