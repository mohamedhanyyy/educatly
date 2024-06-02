import 'package:flutter/material.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../controller/edit_task_controller.dart';

AppBar editTaskAppBar(
    EditTaskController controller, buttonKey, formKey, title, details) {
  return AppBar(
    title: Text(S().edit_task),
  );
}
