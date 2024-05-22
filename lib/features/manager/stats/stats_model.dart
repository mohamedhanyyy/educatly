class StatsModel {
  StatsData? data;
  List<String>? errors;
  List<String>? successMessages;
  int? statusCode;
  bool? success;
  bool? hasException;

  StatsModel(
      {this.data,
      this.errors,
      this.successMessages,
      this.statusCode,
      this.success,
      this.hasException});

  StatsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new StatsData.fromJson(json['data']) : null;
    errors = json['errors'].cast<String>();
    successMessages = json['successMessages'].cast<String>();
    statusCode = json['statusCode'];
    success = json['success'];
    hasException = json['hasException'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    data['successMessages'] = this.successMessages;
    data['statusCode'] = this.statusCode;
    data['success'] = this.success;
    data['hasException'] = this.hasException;
    return data;
  }
}

class StatsData {
  int? taskNewCount;
  int? taskAllCount;
  int? taskInProgressCount;
  int? taskCompleteCount;

  StatsData(
      {this.taskNewCount,
      this.taskAllCount,
      this.taskInProgressCount,
      this.taskCompleteCount});

  StatsData.fromJson(Map<String, dynamic> json) {
    taskNewCount = json['taskNewCount'];
    taskAllCount = json['taskAllCount'];
    taskInProgressCount = json['taskInProgressCount'];
    taskCompleteCount = json['taskCompleteCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskNewCount'] = this.taskNewCount;
    data['taskAllCount'] = this.taskAllCount;
    data['taskInProgressCount'] = this.taskInProgressCount;
    data['taskCompleteCount'] = this.taskCompleteCount;
    return data;
  }
}
