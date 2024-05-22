import 'package:taskaty/features/admin/company/data/model/company_model.dart';
import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../../features/admin/add_task/data/model/add_task_response.dart';
import '../../../features/admin/add_user/data/model/add_user_response.dart';
import '../../../features/admin/edit_task/data/model/edit_task_response.dart';
import '../../../features/admin/tasks/data/model/admin_tasks_model.dart';
import '../../../features/manager/home/data/model/statistics.dart';
import '../../../features/manager/home/data/model/task.dart';
import '../../../features/settings/data/model/privacy.dart';
import '../../../features/shared/auth/login/data/model/auth_response.dart';
import '../../../features/shared/auth/otp/data/model/otp_response.dart';
import 'base_response/base_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (T.toString() == "BaseResponse") {
      return BaseResponse.fromJson(json) as T;
    } else if (T.toString() == "AuthResponse") {
      return AuthResponse.fromJson(json) as T;
    } else if (T.toString() == "OTPResponse") {
      return OTPResponse.fromJson(json) as T;
    } else if (T.toString() == "Privacy") {
      return Privacy.fromJson(json) as T;
    } else if (T.toString() == "TaskModel") {
      return TaskModel.fromJson(json) as T;
    } else if (T.toString() == "CompanyModel") {
      return CompanyModel.fromJson(json) as T;
    } else if (T.toString() == "AdminTasksModel") {
      return AdminTasksModel.fromJson(json) as T;
    } else if (T.toString() == "EditTaskModel") {
      return EditTaskModel.fromJson(json) as T;
    } else if (T.toString() == "ManagerModel") {
      return ManagerModel.fromJson(json) as T;
    } else if (T.toString() == "StatisticsResponse") {
      return StatisticsModel.fromJson(json) as T;
    } else if (T.toString() == "AddUserResponse") {
      return AddUserResponse.fromJson(json) as T;
    } else if (T.toString() == "AddTaskResponse") {
      return AddTaskResponse.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
