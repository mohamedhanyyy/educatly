import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/core/constants/assets.dart';
import 'package:taskaty/core/extensions/async_value_extension.dart';
import 'package:taskaty/core/helpers/toast_helper.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';
import 'package:taskaty/features/admin/home/presentation/bloc/statstics_bloc.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/get_admin_tasks_controller.dart';

import '../../../../../config/l10n/generated/l10n.dart';
import '../../../../../config/router/app_router.dart';
import '../../../../../core/controllers/button/button_controller.dart';
import '../../../../../core/helpers/mappers.dart';
import '../../domain/usecase/add_task_usecase.dart';
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
    int? selectedAssigneToIndex,
    bool? isAddTask,
    bool? isSave,
    ManagerModel? selectedManager,
    DateTime? startDate,
    DateTime? endDate,
    List<File>? filePickerResult,
  }) {
    state = state.copyWith(
      isSaveClick: isSave ?? state.isSaveClick,
      priorityId: selectedPriority ?? state.priorityId,
      selectedManager: selectedManager ?? state.selectedManager,
      selectedAssigneToIndex:
          selectedAssigneToIndex ?? state.selectedAssigneToIndex,
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

    final result = await AsyncValue.guard(
      () => ref.read(addTaskUseCaseProvider(
        title: title,
        description: description,
        startDate: state.startDate!,
        endDate: state.endDate!,
        selectedPriority: priorityIdMapper(state.priorityId),
        selectedAssignee: state.selectedManager,
        files: state.filePickerResult,
        subTasks: state.tasks!,
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
              return doneBottomSheet(S().task_added_successfully);
            });
        AppRouter.navigatorState.currentContext!
            .read<AdminStatsticsCubit>()
            .getStats();
      },
    );
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
