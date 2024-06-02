import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty/core/widgets/custom_text_field.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/theme/sizes_manager.dart';
import '../controller/add_task_controller.dart';

class AddTaskCommentsWidget extends ConsumerWidget {
  AddTaskCommentsWidget({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextInputField(
          onChanged: (val) {
            ref.read(addTaskControllerProvider.notifier).setData(comment: val);
          },
          label: S().write_comment,
          maxLines: null,
          type: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        ),
        AppSizes.size16.verticalSpace,
      ],
    );
  }
}
