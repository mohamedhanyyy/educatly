import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/l10n/generated/l10n.dart';
import '../../../../../../config/theme/sizes_manager.dart';
import '../../../../../../core/constants/assets.dart';
import '../../../data/model/attachment_model.dart';
import '../task_headline.dart';
import 'attachment_widget.dart';

class AttachmentsListWidget extends StatelessWidget {
  final List<AttachmentModel> attachmentsList;

  const AttachmentsListWidget({super.key, required this.attachmentsList});

  @override
  Widget build(BuildContext context) {
    return attachmentsList.isEmpty
        ? SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskHeadLineWidget(
                title: S().documents,
                icon: Assets.icons.attachments,
              ),
              AppSizes.size20.verticalSpace,
              SizedBox(
                height: AppSizes.size40.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: attachmentsList.length,
                  separatorBuilder: (context, index) =>
                      AppSizes.size10.horizontalSpace,
                  itemBuilder: (context, index) {
                    return AttachmentWidget(
                      attachment: attachmentsList[index],
                    );
                  },
                ),
              ),
            ],
          );
  }
}
