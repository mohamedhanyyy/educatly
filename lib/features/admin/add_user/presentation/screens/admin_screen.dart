import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../data/model/user_type_model.dart';
import '../controller/admin_controller/admin_controller.dart';

class AdminScreen extends ConsumerWidget {
  final buttonKey = UniqueKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<UserTypeModel> userTypes = [
    // UserTypeModel(1, "Super Admin"),
    // UserTypeModel(2, "Admin"),
    UserTypeModel(3, "Manager"),
  ];

  AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(adminControllerProvider.notifier);
    final controllerWatcher = ref.watch(adminControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S().add_user),
        backgroundColor: AppColors.colors.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSizes.size10.verticalSpace,
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    CustomTextInputField(
                      label: S().username,
                      controller: userNameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          ValidationService.nameValidation(value),
                    ),
                    AppSizes.size10.verticalSpace,
                    CustomTextInputField(
                      label: S().email,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          ValidationService.emailValidation(value),
                    ),
                    AppSizes.size10.verticalSpace,
                    CustomPasswordInputField(
                      label: S().password,
                      controller: passwordController,
                      validator: (value) =>
                          ValidationService.validatePassword(value),
                    ),
                    AppSizes.size10.verticalSpace,
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(5),
                      child: DropdownButtonFormField2(
                        isExpanded: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: AppSizes.size12),
                        ),
                        validator: (value) => ValidationService.notEmptyField(
                            controllerWatcher.userType?.name),
                        onChanged: (value) {
                          controller.setData(userTypeModel: value);
                        },
                        style: StylesManager.bold(fontSize: AppSizes.size12),
                        hint: Text(
                          controllerWatcher.userType?.name ?? S().user_type,
                          style: TextStyle(color: ColorSystemLight().black2),
                        ),
                        items: userTypes
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.name,
                                    style: StylesManager.bold(
                                        fontSize: AppSizes.size12,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    AppSizes.size10.verticalSpace,
                    CustomTextInputField(
                      label: S().full_name,
                      controller: fullNameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) =>
                          ValidationService.nameValidation(value),
                    ),
                    // AppSizes.size20.verticalSpace,
                    // customDropDown(
                    //     textColor: controllerWatcher.companyName == null
                    //         ? ColorSystemLight().black2
                    //         : ColorSystemLight().black,
                    //     title:
                    //         controllerWatcher.companyName ?? S().company_name,
                    //     widget: controllerWatcher.companyName == null
                    //         ? const SizedBox.shrink()
                    //         : Container(
                    //             width: 40.h,
                    //             height: 40.h,
                    //             padding: EdgeInsets.all(1.h),
                    //             clipBehavior: Clip.antiAlias,
                    //             decoration: BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color: AppColors.colors.background
                    //                   .withOpacity(0.5),
                    //             ),
                    //             child: ClipOval(
                    //               child: AppCachedNetworkImage(
                    //                 "https://media.newyorker.com/photos/59776d0672c5e854a512693d/master/w_2240,c_limit/Hsu-Monkey-Videos-as-a-Way-of-Life.jpg",
                    //               ),
                    //             ),
                    //           ),
                    //     function: () {
                    //       showSearchCompanyBottomSheetContent(context, ref);
                    //     }),
                    AppSizes.size20.verticalSpace,
                    AppDefaultButton(
                      key: buttonKey,
                      text: S().add_user,
                      width: ScreenUtil().screenWidth,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(adminControllerProvider.notifier)
                              .addUser(
                                  key: buttonKey,
                                  fullName: fullNameController.text,
                                  userName: userNameController.text,
                                  password: passwordController.text,
                                  email: emailController.text,
                                  userTypeModel: ref
                                      .read(adminControllerProvider)
                                      .userType);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ).horizontalScreenPadding,
        ),
      ),
    );
  }
}
