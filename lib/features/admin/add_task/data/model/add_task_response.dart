class AddTaskResponse {
  String? title;
  String? description;
  int? statusId;
  int? priorityId;
  String? assignTo;
  String? startDate;
  String? endDate;
  List<SubTasks>? subTasks;

  AddTaskResponse(
      {this.title,
      this.description,
      this.statusId,
      this.priorityId,
      this.assignTo,
      this.startDate,
      this.endDate,
      this.subTasks});

  AddTaskResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    statusId = json['statusId'];
    priorityId = json['priorityId'];
    assignTo = json['assignTo'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['subTasks'] != null) {
      subTasks = <SubTasks>[];
      json['subTasks'].forEach((v) {
        subTasks!.add(new SubTasks.fromJson(v));
      });
    }
  }
}

class SubTasks {
  int? id;
  bool? isDeleted;
  String? description;
  int? taskId;
  bool? isCompleted;
  String? createdBy;

  SubTasks(
      {this.id,
      this.isDeleted,
      this.description,
      this.taskId,
      this.isCompleted,
      this.createdBy});

  SubTasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDeleted = json['isDeleted'];
    description = json['description'];
    taskId = json['taskId'];
    isCompleted = json['isCompleted'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isDeleted'] = this.isDeleted;
    data['description'] = this.description;
    data['taskId'] = this.taskId;
    data['isCompleted'] = this.isCompleted;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
