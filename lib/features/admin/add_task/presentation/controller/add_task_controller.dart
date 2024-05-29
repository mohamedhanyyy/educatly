import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/assets.dart';
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
  AddTaskState build() {
    return AddTaskState(
      startDate: null,
      endDate: null,
      isAddTask: false,
      searchManagerList: [],
    );
  }

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

    state = state.copyWith(
        searchManagerList: searchList.isEmpty ? managersList : searchList);
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
      isAddTask: isAddTask ?? state.isAddTask,
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
        : '${DateFormat('dd-MMM-yyyy - HH:mm').format(state.startDate!)}';
  }

  String getFormattedEndDate() {
    return state.endDate == null
        ? S().end_date
        : '${DateFormat('dd-MMM-yyyy - HH:mm').format(state.endDate!)}';
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
        state.tasks == null) {
      if (state.tasks == null) Toast.showErrorToast(S().subtasks_empty);
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

    Response? response = await DioHelper.postData(
      url: Api.addTask,
      data: {
        "title": title,
        "description": description,
        "priorityId": (state.priorityId!),
        "assignTo": state.selectedManager!.id,
        "startDate": '${state.startDate}'.replaceAll(' ', 'T'),
        "endDate": '${state.endDate}'.replaceAll(' ', 'T'),
        "subTasks": state.tasks!.map((e) => {"description": e}).toList(),
        "comments": [state.comment].map((e) => {"description": e}).toList(),
      },
    );
    if (response?.statusCode == 200) {
      print('ok');
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
      print(response?.data);
      print(response?.statusCode);
      print(response?.requestOptions.data);
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }

  buildSvgPicture(int? priorityId) {
    Map<int, String> map = {
      1: Assets.icons.flag0,
      2: Assets.icons.flag1,
      3: Assets.icons.flag2,
    };
    if (priorityId != null) return SvgPicture.asset(map[priorityId]!);
  }
}
