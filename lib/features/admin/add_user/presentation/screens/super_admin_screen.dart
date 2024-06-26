import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/widget_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/image_picker.dart';
import '../../data/model/user_type_model.dart';
import '../controller/super_admin/super_admin_controller.dart';

class SuperAdminScreen extends ConsumerStatefulWidget {
  const SuperAdminScreen({super.key});

  @override
  ConsumerState<SuperAdminScreen> createState() => _SuperAdminScreenState();
}

class _SuperAdminScreenState extends ConsumerState<SuperAdminScreen> {
  final buttonKey = UniqueKey();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  File? file;

  final List<UserTypeModel> userTypes = [
    UserTypeModel(2, "Admin"),
    UserTypeModel(3, "Manager")
  ];

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(superAdminControllerProvider.notifier);
    final controllerWatcher = ref.watch(superAdminControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text(S().add_user)),
      body: SingleChildScrollView(
        child: Form(
          key: loginKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizes.size10.verticalSpace,
              CustomTextInputField(
                label: S().username,
                controller: userNameController,
                textInputAction: TextInputAction.next,
                validator: (value) => ValidationService.nameValidation(value),
              ),
              AppSizes.size10.verticalSpace,
              CustomTextInputField(
                label: S().full_name,
                controller: fullNameController,
                textInputAction: TextInputAction.next,
                validator: (value) => ValidationService.nameValidation(value),
              ),
              AppSizes.size10.verticalSpace,
              CustomTextInputField(
                label: S().email,
                controller: mailController,
                textInputAction: TextInputAction.next,
                validator: (value) => ValidationService.emailValidation(value),
              ),
              AppSizes.size10.verticalSpace,
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(5),
                child: DropdownButtonFormField2(
                  isExpanded: true,
                  value: controllerWatcher.userType,
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
              AppSizes.size20.verticalSpace,
              Text(S().user_image,
                  style: StylesManager.semiBold(fontSize: 13.sp)),
              AppSizes.size5.verticalSpace,
              InkWell(
                onTap: () {
                  PickerDialog().pickGalleryImage(onGet: (v) {
                    file = v;
                    setState(() {});
                  });
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  radius: const Radius.circular(12),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: double.infinity,
                      height: 200.sp,
                      child: file == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.addTask,
                                  width: 40,
                                  height: 40,
                                ),
                                AppSizes.size12.verticalSpace,
                              ],
                            )
                          : Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      width: double.infinity,
                                      height: 200.sp,
                                      File(file!.path),
                                      fit: BoxFit.cover,
                                    )),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 15,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        file = null;
                                      });
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              AppSizes.size20.verticalSpace,
            ],
          ),
        ).horizontalScreenPadding,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppDefaultButton(
          key: buttonKey,
          text: S().add_user,
          backgroundColor: AppColors.colors.darkBlue,
          onPressed: () {
            if (loginKey.currentState!.validate()) {
              ref.read(superAdminControllerProvider.notifier).addUser(
                    key: buttonKey,
                    fullName: fullNameController.text,
                    userName: userNameController.text,
                    userTypeModel: controllerWatcher.userType,
                    email: mailController.text,
                    file: file!,
                  );
            }
          },
        ),
      ),
    );
  }
}
