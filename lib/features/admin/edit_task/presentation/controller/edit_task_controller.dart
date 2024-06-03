import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/assets.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';
import 'package:taskaty/features/shared/auth/login/presentation/controller/login_model.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../../../add_task/data/model/add_task_response.dart';
import '../../../add_task/presentation/widgets/add_task_done_bottomsheet.dart';
import '../../../tasks/data/model/admin_tasks_model.dart';
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
    bool? isEditComment,
    bool? isSave,
    String? taskTitle,
    String? taskDescription,
    ManagerModel? selectedAssigne,
    DateTime? startDate,
    DateTime? endDate,
    List<File>? filePickerResult,
    List<SubTasks>? tasks,
    List<Comments>? comments,
  }) {
    state = state.copyWith(
      isSaveClick: isSave ?? state.isSaveClick,
      taskId: taskId ?? state.taskId,
      isEditComment: isEditComment ?? state.isEditComment,
      comments: comments ?? state.comments,
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

  void setComment({required Comments comment}) {
    final newList = List<Comments>.from(state.comments ?? []);
    newList.remove(comment);
    newList.add(comment);
    state = state.copyWith(comments: newList);
  }

  void removeComment({required Comments comment}) {
    final newList = List<Comments>.from(state.comments ?? []);
    newList.remove(comment);
    state = state.copyWith(comments: newList);
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

    Response? response = await DioHelper.postData(url: Api.updateTask, data: {
      "title": title,
      "id": state.taskId,
      "description": description,
      "statusId": state.statusId,
      "priorityId": state.selectedPriority,
      "assignTo": "${state.selectedAssigne!.id}",
      "startDate": '${state.startDate}'.replaceAll(' ', 'T'),
      "endDate": '${state.endDate}'.replaceAll(' ', 'T'),
      "subTasks": state.subTasks!
          .map((e) =>
              {"description": '${e.description}', 'isCompleted': e.isCompleted})
          .toList(),
      "comments": state.comments!.map((e) => {"description": '${e}'}).toList(),
    });

    if (response?.data['statusCode'] <= 204) {
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      showModalBottomSheet(
          context: AppRouter.navigatorState.currentContext!,
          builder: (context) {
            return DoneBottomSheet(message: S().task_edited_successfully);
          });
      ref.invalidate(getAdminTasksControllerProvider);
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
      LoginModel loginModel = LoginModel.fromJson(response?.data);
      if (loginModel.errors != null)
        Toast.showErrorToast('${loginModel.errors?.first}');
    }
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
