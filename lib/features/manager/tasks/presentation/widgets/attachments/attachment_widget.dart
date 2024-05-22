import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/extensions/file_ext.dart';

import '../../../../../../config/theme/font_system/app_fonts.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../config/theme/styles_manager.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../data/model/attachment_model.dart';
import 'attachment_view.dart';

class AttachmentWidget extends StatelessWidget {
  final AttachmentModel attachment;

  const AttachmentWidget({super.key, required this.attachment});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: AppConstants.defaultBorderRadius,
      color: Theme.of(context).listTileTheme.tileColor,
      child: InkWell(
        onTap: () async => await showModalBottomSheet(
          context: context,
          showDragHandle: true,
          useRootNavigator: true,
          isScrollControlled: true,
          builder: (context) => AttachmentViewScreen(url: attachment.url),
        ),
        child: Container(
          height: AppSizes.size40.h,
          padding: AppConstants.defaultPadding,
          child: Row(
            children: [
              Text(
                attachment.name,
                style: StylesManager.medium(
                  fontSize: AppFonts.font.xXSmall.sp,
                ),
              ),
              AppSizes.size4.horizontalSpace,
              SizedBox(
                width: AppSizes.size20.h,
                height: AppSizes.size20.h,
                child: SvgPicture.asset(attachment.extension.getFileExtImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
