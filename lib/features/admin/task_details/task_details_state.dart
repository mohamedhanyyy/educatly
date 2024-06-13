import 'package:taskaty/features/admin/tasks/data/model/admin_tasks_model.dart';

abstract class TaskDetailsState {}

class TaskDetailsInitial extends TaskDetailsState {}

class TaskDetailsLoading extends TaskDetailsState {}

class TaskDetailsDone extends TaskDetailsState {
  AdminTasksModel adminTasksModel;
  TaskDetailsDone(this.adminTasksModel);
}

class TaskDetailsError extends TaskDetailsState {}
