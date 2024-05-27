import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/features/admin/edit_task/presentation/controller/edit_task_controller.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/get_admin_tasks_controller.dart';

import '../../../../core/controllers/button/button_controller.dart';
import '../../../../core/services/dio_helper/dio_helper.dart';

part 'add_comment_controller.freezed.dart';
part 'add_comment_controller.g.dart';
part 'add_comment_state.dart';

@riverpod
class AddCommentController extends _$AddCommentController {
  AddCommentState build() {
    return AddCommentState();
  }

  void setData({
    bool? isAddTask,
  }) {
    state = state.copyWith();
  }

  Future<void> addComment({
    required Key key,
    required String comment,
    required String taskId,
    required WidgetRef ref,
  }) async {
    ref.read(buttonControllerProvider.notifier).setLoadingStatus(key);

    Response? response = await DioHelper.postData(
      url: 'Comment',
      data: {
        'taskId': taskId,
        'description': comment,
      },
    );
    if (response?.statusCode == 200) {
      ref.read(buttonControllerProvider.notifier).setSuccessStatus(key);
      ref.invalidate(addCommentControllerProvider);
      ref.invalidate(getAdminTasksControllerProvider);
      ref.invalidate(editTaskControllerProvider);
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }
}
