import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskaty/core/extensions/context_extension.dart';
import 'package:taskaty/features/manager/home/presentation/controller/comments/controller/manager_comments_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/color_system/color_system_light.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../admin/tasks/data/model/admin_tasks_model.dart';

class ManagerAddCommentWidget extends ConsumerWidget {
  ManagerAddCommentWidget(this.taskDetails, {super.key});
  static final commentButtonKey = UniqueKey();
  final TextEditingController commentsController = TextEditingController();
  late final AdminTasksModel taskDetails;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).cardColor)),
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (context) => Container(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: 40,
                                child: CustomTextInputField(
                                  label: S().add_comment,
                                  autoFocus: true,
                                  controller: commentsController,
                                ),
                              ),
                            ),
                            AppSizes.size5.horizontalSpace,
                            AppDefaultButton(
                                borderRadius: 2,
                                key: commentButtonKey,
                                width: AppSizes.size45.w,
                                height: AppSizes.size45.w,
                                child: RotatedBox(
                                    quarterTurns:
                                        context.isCurrentArabic ? 3 : 0,
                                    child: SvgPicture.asset(Assets.icons.send)),
                                textColor: ColorSystemLight().scaffold,
                                backgroundColor: ColorSystemLight().primary,
                                onPressed: () {
                                  if (commentsController.text == '') return;
                                  taskDetails.comments?.add(Comments(
                                      description: commentsController.text));
                                  ref
                                      .read(managerCommentsControllerProvider
                                          .notifier)
                                      .addComment(
                                        key: commentButtonKey,
                                        comment: commentsController.text,
                                        taskId: taskDetails.id.toString(),
                                        ref: ref,
                                      );
                                  commentsController.clear();
                                })
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S().add_comment),
            Container(
              width: AppSizes.size45.w,
              height: AppSizes.size45.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorSystemLight().primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RotatedBox(
                    quarterTurns: context.isCurrentArabic ? 3 : 0,
                    child: SvgPicture.asset(Assets.icons.send)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
