import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/assets.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';
import 'package:taskaty/features/admin/edit_task/domain/usecase/edit_task_usecase.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../../../add_task/presentation/widgets/add_task_done_bottomsheet.dart';
import '../../../tasks/presentation/controller/get_admin_tasks_controller.dart';

part 'edit_task_controller.freezed.dart';
part 'edit_task_controller.g.dart';
part 'edit_task_state.dart';

@riverpod
class EditTaskController extends _$EditTaskController {
  EditTaskState build() {
    return EditTaskState();
  }

  void clearList() {
    state = state.copyWith(searchAssigneToList: []);
  }

  void setData({
    int? selectedPriority,
    int? taskId,
    int? statusId,
    bool? isEditTask,
    bool? isSave,
    String? taskTitle,
    String? taskDescription,
    ManagerModel? selectedAssigne,
    DateTime? startDate,
    DateTime? endDate,
    List<File>? filePickerResult,
    List<SubTasks>? tasks,
  }) {
    state = state.copyWith(
      isSaveClick: isSave ?? state.isSaveClick,
      taskId: taskId ?? state.taskId,
      subTasks: tasks ?? state.subTasks,
      searchAssigneToList: state.searchAssigneToList,
      selectedPriority: selectedPriority ?? state.selectedPriority,
      statusId: statusId ?? state.statusId,
      selectedAssigne: selectedAssigne ?? state.selectedAssigne,
      taskTitle: taskTitle ?? state.taskTitle,
      taskDescription: taskDescription ?? state.taskDescription,
      startDate: startDate ?? state.startDate,
      isEditTask: isEditTask ?? state.isEditTask,
      endDate: endDate ?? state.endDate,
    );
  }

  void setTask({required SubTasks task}) {
    final newList = List<SubTasks>.from(state.subTasks ?? []);
    newList.remove(task);
    newList.add(task);
    state = state.copyWith(subTasks: newList);
  }

  void removeTask({required SubTasks task}) {
    final newList = List<SubTasks>.from(state.subTasks ?? []);
    newList.remove(task);
    state = state.copyWith(subTasks: newList);
  }

  String getFormattedStartDate() {
    return state.startDate == null
        ? S().start_date
        : '${DateFormat('dd-MMM-yyyy - HH:mm').format(state.startDate!)}';
  }

  String getFormattedEndDate() {
    return state.endDate == null
        ? S().end_date
        : '${DateFormat('dd-MMM-yyyy - HH:mm').format(state.endDate!)}';
  }

  Future<void> editTask({
    required String title,
    required String description,
    required Key key,
  }) async {
    if ((state.selectedAssigne?.id == null)) return;
    if (state.subTasks == null || state.subTasks?.isEmpty == true) {
      Toast.showErrorToast(S().subtasks_empty);
      return;
    }

    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    var result = await AsyncValue.guard(
      () => ref.read(editTaskUseCaseProvider(
        title: title,
        taskId: state.taskId!,
        description: description,
        startDate: state.startDate!,
        endDate: state.endDate!,
        statusId: state.statusId!,
        selectedPriority: state.selectedPriority!,
        selectedAssignee: state.selectedAssigne,
        subTasks: state.subTasks!,
      ).future),
    );

    result.handleGuardResults(
      ref: ref,
      onError: () {
        if (AppRouter.router.canPop()) AppRouter.router.pop();
        ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      },
      onSuccess: () {
        ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
        ref.invalidate(getAdminTasksControllerProvider);

        showModalBottomSheet(
            context: AppRouter.navigatorState.currentContext!,
            builder: (context) {
              return doneBottomSheet(S().task_edited_successfully);
            });
      },
    );
  }

  buildSvgPicture(name) {
    Map<String, String> map = {
      'Low': Assets.icons.flag0,
      'منخفضة': Assets.icons.flag0,
      'متوسطة': Assets.icons.flag1,
      'مرتفعة': Assets.icons.flag2,
      'Medium': Assets.icons.flag1,
      'High': Assets.icons.flag2,
    };
    if (name != null) return SvgPicture.asset(map[name]!);
  }
}
