import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/config/theme/color_system/app_colors.dart';
import 'package:taskaty/config/theme/styles_manager.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/widget_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/services/validation/validation_service.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/image_picker.dart';
import '../../../../../core/widgets/network_image.dart';
import '../../../add_task/presentation/widgets/custom_dropdown.dart';
import '../controller/add_company_controller.dart';
import 'add_company_search_managers.dart';

class AddCompanyScreen extends ConsumerStatefulWidget {
  const AddCompanyScreen({super.key});

  @override
  ConsumerState<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends ConsumerState<AddCompanyScreen> {
  static final buttonKey = UniqueKey();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? file;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controllerWatcher = ref.watch(addCompanyControllerProvider);
    final controllerReader = ref.read(addCompanyControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(S().add_company),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizes.size20.verticalSpace,
              CustomTextInputField(
                label: S().company_arabic_name,
                controller: arabicNameController,
                textInputAction: TextInputAction.next,
                validator: (value) => ValidationService.notEmptyField(value),
              ),
              AppSizes.size10.verticalSpace,
              CustomTextInputField(
                label: S().company_english_name,
                controller: englishNameController,
                validator: (value) => ValidationService.notEmptyField(value),
              ),
              AppSizes.size10.verticalSpace,
              CustomTextInputField(
                label: S().company_address,
                controller: addressController,
                suffix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.location_city,
                      color: AppColors.colors.primary),
                ),
                validator: (value) => ValidationService.notEmptyField(value),
              ),
              AppSizes.size10.verticalSpace,
              customDropDown(
                  textColor: controllerWatcher.selectedManager != null
                      ? Theme.of(context).secondaryHeaderColor
                      : Theme.of(context).hintColor,
                  title: controllerWatcher.selectedManager?.userName ??
                      S().manager_name,
                  widget: controllerWatcher.selectedManager == null
                      ? const SizedBox.shrink()
                      : Container(
                          width: 40.h,
                          height: 40.h,
                          padding: EdgeInsets.all(1.h),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colors.background.withOpacity(0.5),
                          ),
                          child: ClipOval(
                            child: AppCachedNetworkImage(
                                "${AppConstants.subDomain}${controllerWatcher.selectedManager?.imageName}"),
                          ),
                        ),
                  function: () {
                    addCompanySearchManagers(context, ref);
                  }),
              AppSizes.size20.verticalSpace,
              Text(S().add_logo,
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
                  radius: Radius.circular(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: double.infinity,
                      height: 172.sp,
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
                                Text(
                                  S().add_logo,
                                  style: StylesManager.medium(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            )
                          : Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      width: double.infinity,
                                      height: 172.sp,
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
                                    icon: Icon(Icons.close),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              AppSizes.size70.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size26.w),
                child: Row(
                  children: [
                    Flexible(
                      child: Consumer(
                        builder: (_, ref, __) {
                          return AppDefaultButton(
                            key: buttonKey,
                            text: S().save,
                            radius: 15,
                            width: ScreenUtil().screenWidth,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controllerReader.addCompany(
                                  key: buttonKey,
                                  address: addressController.text,
                                  arabicName: arabicNameController.text,
                                  englishName: englishNameController.text,
                                  companyLogo: file,
                                  managerId:
                                      controllerWatcher.selectedManager!.id!,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    AppSizes.size30.horizontalSpace,
                    Flexible(
                      child: AppDefaultButton(
                          text: S().cancel,
                          borderRadius: 2,
                          isBordered: true,
                          radius: 15,
                          textColor: AppColors.colors.primary,
                          borderColor: Colors.blue,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            AppRouter.router.pop();
                          }),
                    )
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
