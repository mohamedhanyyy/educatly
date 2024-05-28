import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskaty/config/router/app_router.dart';
import 'package:taskaty/features/admin/tasks/presentation/controller/get_admin_tasks_controller.dart';

import '../../../../../../../core/controllers/button/button_controller.dart';
import '../../../../../../../core/services/dio_helper/dio_helper.dart';
import '../../../../../../admin/comment/controller/add_comment_controller.dart';

part 'manager_comments_controller.freezed.dart';
part 'manager_comments_controller.g.dart';
part 'manager_comments_state.dart';

@riverpod
class ManagerCommentsController extends _$ManagerCommentsController {
  ManagerCommentsState build() {
    return ManagerCommentsState();
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
      AppRouter.router.pop();
    } else {
      ref.read(buttonControllerProvider.notifier).setErrorStatus(key);
    }
  }
}
