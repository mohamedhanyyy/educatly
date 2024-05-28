import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/theme/color_system/app_colors.dart';
import '../../../../admin/tasks/data/model/admin_tasks_model.dart';

class ManagerSubTaskWidget extends ConsumerStatefulWidget {
  ManagerSubTaskWidget(
      {super.key, required this.taskDetails, required this.selected});
  late AdminTasksModel taskDetails;
  List<bool> selected = [];

  @override
  ConsumerState<ManagerSubTaskWidget> createState() =>
      _ManagerSubTaskWidgetState();
}

class _ManagerSubTaskWidgetState extends ConsumerState<ManagerSubTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.taskDetails.subTasks!.map((e) {
        bool status = widget.selected[widget.taskDetails.subTasks!.indexOf(e)];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            minTileHeight: 48,
            selectedColor: Theme.of(context).secondaryHeaderColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 1, color: Colors.lightBlue.shade100)),
            leading: IconButton(
              iconSize: status ? 25 : 20,
              icon: Icon(status
                  ? Icons.task_alt_outlined
                  : Icons.check_circle_outline),
              color: status
                  ? AppColors.colors.green
                  : Theme.of(context).secondaryHeaderColor,
              onPressed: () {
                widget.selected[widget.taskDetails.subTasks!.indexOf(e)] =
                    !widget.selected[widget.taskDetails.subTasks!.indexOf(e)];
                setState(() {});
              },
            ),
            onTap: () {
              widget.selected[widget.taskDetails.subTasks!.indexOf(e)] =
                  !status;
              setState(() {});
            },
            title: Text(
              '${e.description}',
              selectionColor: Theme.of(context).scaffoldBackgroundColor,
              style: TextStyle(
                  decoration: status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            selected: status,
          ),
        );
      }).toList(),
    );
  }
}
