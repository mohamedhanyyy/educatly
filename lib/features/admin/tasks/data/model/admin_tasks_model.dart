import 'package:taskaty/features/admin/get_managers/data/model/get_managers_model.dart';

import '../../../add_task/data/model/add_task_response.dart';

class AdminTasksModel {
  int? id;
  String? title;
  String? description;
  int? statusId;
  int? priorityId;
  String? assignTo;
  String? userName;
  String? startDate;
  String? endDate;
  ManagerModel? user;
  List<SubTasks>? subTasks;
  List<Comments>? comments;

  AdminTasksModel(
      {this.id,
      this.title,
      this.description,
      this.statusId,
      this.priorityId,
      this.assignTo,
      this.userName,
      this.startDate,
      this.endDate,
      this.user,
      this.subTasks,
      this.comments});

  AdminTasksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    statusId = json['statusId'];
    priorityId = json['priorityId'];
    assignTo = json['assignTo'];
    userName = json['userName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    user =
        json['user'] != null ? new ManagerModel.fromJson(json['user']) : null;
    if (json['subTasks'] != null) {
      subTasks = <SubTasks>[];
      json['subTasks'].forEach((v) {
        subTasks!.add(new SubTasks.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['statusId'] = this.statusId;
    data['priorityId'] = this.priorityId;
    data['assignTo'] = this.assignTo;
    data['userName'] = this.userName;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.subTasks != null) {
      data['subTasks'] = this.subTasks!.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? taskId;
  String? description;

  Comments({this.taskId, this.description});

  Comments.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this.taskId;
    data['description'] = this.description;
    return data;
  }
}
