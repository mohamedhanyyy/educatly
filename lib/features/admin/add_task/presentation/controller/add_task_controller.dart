import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/constants.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';
import 'package:taskaty/core/services/dio_helper/dio_helper.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';
import 'package:taskaty/features/admin/home/presentation/bloc/statstics_bloc.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/get_admin_tasks_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/services/network/api/network_api.dart';
import '../widgets/add_task_done_bottomsheet.dart';

part 'add_task_controller.freezed.dart';
part 'add_task_controller.g.dart';
part 'add_task_state.dart';

@riverpod
class AddTaskController extends _$AddTaskController {
  AddTaskState build() => const AddTaskState();

  void clearList() {
    state = state.copyWith(searchManagerList: []);
  }

  void searchCompanyName(String text, List<ManagerModel> managersList) {
    List<ManagerModel> searchList = [];
    managersList.map((element) {
      if (element.userName?.contains(text) == true) {
        searchList.add(element);
      }
    }).toList();

    state = state.copyWith(searchManagerList: searchList.isEmpty ? managersList : searchList);
  }

  void setData({
    int? selectedPriority,
    bool? isAddTask,
    String? comment,
    bool? isSave,
    ManagerModel? selectedManager,
    DateTime? startDate,
    DateTime? endDate,
    List<File>? filePickerResult,
  }) {
    state = state.copyWith(
      comment: comment ?? state.comment,
      isSaveClick: isSave ?? state.isSaveClick,
      priorityId: selectedPriority ?? state.priorityId,
      selectedManager: selectedManager ?? state.selectedManager,
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
      filePickerResult: filePickerResult ?? state.filePickerResult,
    );
  }

  void setTask({required String task}) {
    final newList = List<String>.from(state.tasks ?? []);
    newList.remove(task);
    newList.add(task);
    state = state.copyWith(tasks: newList);
  }

  void removeTask({required String task}) {
    final newList = List<String>.from(state.tasks ?? []);
    newList.remove(task);
    state = state.copyWith(tasks: newList);
  }

  void removeDocument(File e) {
    final newList = List<File>.from(state.filePickerResult ?? []);
    newList.removeWhere((element) => element == e);
    state = state.copyWith(filePickerResult: newList);
  }

  String getFormattedStartDate() {
    return state.startDate == null
        ? S().start_date
        : '${DateFormat(AppConstants.normalFormat).format(state.startDate!)}';
  }

  String getFormattedEndDate() {
    return state.endDate == null
        ? S().end_date
        : '${DateFormat(AppConstants.normalFormat).format(state.endDate!)}';
  }

  Future<void> addTask({
    required String title,
    required String description,
    required Key key,
  }) async {
    if (state.priorityId == null ||
        state.selectedManager == null ||
        state.startDate == null ||
        state.endDate == null ||
        state.tasks == null ||
        state.tasks?.isEmpty == true) {
      if (state.tasks == null || state.tasks?.isEmpty == true)
        Toast.showErrorToast(S().subtasks_empty);
      return;
    }

    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    // List<MultipartFile> fileList = [];
    // files?.map((e) async {
    //   fileList.add(await MultipartFile.fromFile(e.path));
    // }).toList();

    // final list =subTasks.map((e)   async {
    //   return {
    //     "description":e,
    //     "id":'${ await AppSettingsDatabase.instance.getAuthResponse()?.id}',
    //     "isDeleted": true,
    //     "isCompleted": true,
    //     "createdBy": "string",
    //   };
    // }).toList();

    final response = await DioHelper.postData(
      url: Api.addTask,
      data: {
        "title": title,
        "description": description,
        "priorityId": (state.priorityId!),
        "assignTo": state.selectedManager!.id,
        "startDate": '${state.startDate}'.replaceAll(' ', 'T'),
        "endDate": '${state.endDate}'.replaceAll(' ', 'T'),
        "subTasks": state.tasks!.map((e) => {"description": e}).toList(),
        "comments": state.comment == null
            ? []
            : [state.comment].map((e) => {"description": e}).toList(),
      },
    );
    if (response?.statusCode == 200) {
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      ref.invalidate(getAdminTasksControllerProvider);

      showModalBottomSheet(
          context: AppRouter.navigatorState.currentContext!,
          builder: (context) =>
              DoneBottomSheet(message: S().task_added_successfully));
      AppRouter.navigatorState.currentContext!
          .read<AdminStatsticsCubit>()
          .getStats();
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }
}
