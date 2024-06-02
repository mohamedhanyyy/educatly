import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../comment/controller/add_comment_controller.dart';
import '../../../tasks/data/model/admin_tasks_model.dart';

class AdminCommentsWidget extends ConsumerWidget {
  AdminCommentsWidget(this.taskDetails);
  static final commentButtonKey = UniqueKey();
  final TextEditingController commentsController = TextEditingController();
  late final AdminTasksModel taskDetails;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).secondaryHeaderColor)),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) => Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: CustomTextInputField(
                              maxLines: null,
                              type: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              label: S().add_comment,
                              controller: commentsController,
                            ),
                          ),
                          AppSizes.size5.horizontalSpace,
                          Consumer(
                            builder: (_, ref, __) {
                              return AppDefaultButton(
                                  borderRadius: 2,
                                  key: commentButtonKey,
                                  width: AppSizes.size50.w,
                                  height: AppSizes.size45.h,
                                  borderColor: ColorSystemLight().primary,
                                  isBordered: true,
                                  child: SvgPicture.asset(Assets.icons.send),
                                  textColor: ColorSystemLight().scaffold,
                                  backgroundColor: ColorSystemLight().primary,
                                  onPressed: () {
                                    if (commentsController.text == '') return;
                                    taskDetails.comments?.add(Comments(
                                        description: commentsController.text));
                                    ref
                                        .read(addCommentControllerProvider
                                            .notifier)
                                        .addComment(
                                            key: commentButtonKey,
                                            comment: commentsController.text,
                                            taskId: taskDetails.id.toString(),
                                            ref: ref);
                                    commentsController.clear();
                                  });
                            },
                          )
                        ],
                      ),
                    ),
                  ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(S().add_comment),
            ),
            Container(
              key: commentButtonKey,
              width: AppSizes.size45.w,
              height: AppSizes.size45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorSystemLight().primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(Assets.icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
