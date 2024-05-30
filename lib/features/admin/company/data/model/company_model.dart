class CompanyModel {
  int? id;
  TasksState? tasksState;
  String? nameEn;
  String? nameAr;
  String? address;
  String? logo;
  Manager? manager;
  String? managerId;

  CompanyModel(
      {this.id,
      this.tasksState,
      this.nameEn,
      this.nameAr,
      this.address,
      this.logo,
      this.manager,
      this.managerId});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tasksState = json['tasksState'] != null
        ? new TasksState.fromJson(json['tasksState'])
        : null;
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    address = json['address'];
    logo = json['logo'];
    manager =
        json['manager'] != null ? new Manager.fromJson(json['manager']) : null;
    managerId = json['managerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.tasksState != null) {
      data['tasksState'] = this.tasksState!.toJson();
    }
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['address'] = this.address;
    data['logo'] = this.logo;
    if (this.manager != null) {
      data['manager'] = this.manager!.toJson();
    }
    data['managerId'] = this.managerId;
    return data;
  }
}

class TasksState {
  int? taskInProgressCount;
  int? taskCompleteCount;

  TasksState({this.taskInProgressCount, this.taskCompleteCount});

  TasksState.fromJson(Map<String, dynamic> json) {
    taskInProgressCount = json['taskInProgressCount'];
    taskCompleteCount = json['taskCompleteCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskInProgressCount'] = this.taskInProgressCount;
    data['taskCompleteCount'] = this.taskCompleteCount;
    return data;
  }
}

class Manager {
  String? id;
  String? userName;
  String? imageName;

  Manager({this.id, this.userName, this.imageName});

  Manager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['imageName'] = this.imageName;
    return data;
  }
}
