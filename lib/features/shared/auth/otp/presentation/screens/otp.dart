import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/assets.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../controller/otp_controller.dart';

class OTPScreen extends StatefulWidget {
  final String email;

  const OTPScreen({super.key, required this.email});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late Timer timer;
  bool _canResend = false;
  int _secondsRemaining = 30;
  final focusNode = FocusNode();
  static final buttonKey = UniqueKey();
  TextEditingController pinController = TextEditingController();
  static final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_secondsRemaining != 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 30;
      _canResend = false;
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().otp)),
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
                    color: Color(0xffF8F8F8),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.icons.email,
                  ),
                ),
              ),
              AppSizes.size20.verticalSpace,
              Text(
                S().otp,
                style: StylesManager.bold(
                  fontSize: AppFonts.font.xXXLarge.sp,
                ),
              ),
              AppSizes.size16.verticalSpace,
              Text(
                S().otp_send_to,
                style: StylesManager.semiBold(
                  fontSize: AppFonts.font.small.sp,
                ),
              ),
              AppSizes.size6.verticalSpace,
              Text(
                widget.email,
                style: StylesManager.extraBold(
                  fontSize: AppFonts.font.small.sp,
                ),
              ),
              Form(
                key: otpKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        autofocus: true,
                        focusNode: focusNode,
                        controller: pinController,
                        listenForMultipleSmsOnAndroid: true,
                        validator: (value) {
                          return null;

                          //  'Otp is incorrect'
                        },
                        defaultPinTheme: defaultPinTheme(context),
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onClipboardFound: (value) =>
                            pinController.setText(value),
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        errorTextStyle: StylesManager.medium(
                          color: AppColors.colors.error,
                          fontSize: AppFonts.font.large.sp,
                        ),
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: AppSizes.size20.w,
                              height: AppSizes.size2.h,
                              color: AppColors.colors.primary,
                              margin: EdgeInsets.only(
                                bottom: AppSizes.size8.h,
                              ),
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme(context).copyWith(
                          width: 75.h,
                          height: 75.h,
                          decoration:
                              defaultPinTheme(context).decoration!.copyWith(
                                    border: Border.all(
                                      color: AppColors.colors.primary,
                                    ),
                                  ),
                        ),
                        errorPinTheme: defaultPinTheme(context).copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ).paddingSymmetric(vertical: AppSizes.size30),
                    Consumer(
                      builder: (_, ref, __) {
                        return AppDefaultButton(
                          key: buttonKey,
                          text: S().confirm,
                          width: ScreenUtil().screenWidth,
                          onPressed: () {
                            if (otpKey.currentState!.validate()) {
                              ref
                                  .read(otpControllerProvider.notifier)
                                  .verifyOTP(
                                    key: buttonKey,
                                    email: widget.email,
                                    otp: pinController.text,
                                  );
                            }
                          },
                        );
                      },
                    ),
                    AppSizes.size20.verticalSpace,
                    _canResend
                        ? Consumer(
                            builder: (_, ref, __) {
                              return InkWell(
                                onTap: !_canResend
                                    ? null
                                    : () async {
                                        _resendCode();
                                        await ref
                                            .read(
                                                otpControllerProvider.notifier)
                                            .resendOTP(
                                              email: widget.email,
                                            );
                                      },
                                child: Text(
                                  S().resend_otp,
                                  style: StylesManager.bold(
                                    fontSize: AppFonts.font.medium.sp,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            },
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S().resend_otp_to,
                                style: StylesManager.regular(
                                  fontSize: AppFonts.font.medium.sp,
                                ),
                              ),
                              AppSizes.size4.horizontalSpace,
                              Text(
                                _secondsRemaining.toString() +
                                    ' ' +
                                    S().seconds,
                                style: StylesManager.bold(
                                  fontSize: AppFonts.font.medium.sp,
                                ),
                              ),
                            ],
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

PinTheme defaultPinTheme(context) {
  return PinTheme(
    width: 70.h,
    height: 70.h,
    textStyle: StylesManager.extraBold(
      fontSize: AppFonts.font.xXXLarge.sp,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
}
