import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../config/theme/styles_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../controller/add_task_controller.dart';

class AddTaskFilesWidget extends ConsumerWidget {
  final List<File> file = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ref.watch(addTaskControllerProvider).filePickerResult != null &&
            ref.watch(addTaskControllerProvider).filePickerResult?.isNotEmpty ==
                true) ...[
          SizedBox(
            height: AppSizes.size40.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ref
                  .watch(addTaskControllerProvider)
                  .filePickerResult!
                  .map((e) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/icons/${e.path.split('.').last}.svg'),
                        AppSizes.size6.horizontalSpace,
                        SizedBox(
                          width: AppSizes.size60.w,
                          child: Text(
                            '${e.path}',
                            maxLines: 1,
                            style: StylesManager.medium(
                                textOverflow: TextOverflow.clip,
                                fontSize: AppSizes.size8,
                                color: Theme.of(context).shadowColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            file.remove(e);
                            ref
                                .read(addTaskControllerProvider.notifier)
                                .removeDocument(e);
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: EdgeInsets.all(1),
                            child: FittedBox(
                              child: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          AppSizes.size20.verticalSpace,
        ] else ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.size6.w),
            child: Text(
              S().add_document,
              style: StylesManager.semiBold(fontSize: AppSizes.size12),
            ),
          ),
          AppSizes.size10.verticalSpace,
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowMultiple: true,
                  allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg']);

              if (result != null) {
                result.files.forEach((element) {
                  file.add(File(element.path!));
                });
                ref
                    .read(addTaskControllerProvider.notifier)
                    .setData(filePickerResult: file);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppSizes.size15.h, horizontal: AppSizes.size24.w),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorSystemLight().scaffold,
                  borderRadius: BorderRadius.circular(AppSizes.size10),
                  border:
                      Border.all(color: ColorSystemLight().appBar, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.addTask,
                    width: AppSizes.size40,
                    height: AppSizes.size40,
                  ),
                  AppSizes.size8.horizontalSpace,
                  Text(S().add_document,
                      style: StylesManager.medium(
                          color: ColorSystemLight().black2,
                          fontSize: AppSizes.size16))
                ],
              ),
            ),
          ),
          AppSizes.size20.verticalSpace,
        ],
      ],
    );
  }
}
