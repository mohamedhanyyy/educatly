class NotificationsModel {
  List<NotificationData>? data;

  NotificationsModel({this.data});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class NotificationData {
  int? id;
  String? title;
  String? body;
  String? senderTime;
  String? userId;
  bool? isRead;
  int? taksId;

  NotificationData(
      {this.id,
      this.title,
      this.body,
      this.senderTime,
      this.userId,
      this.isRead,
      this.taksId});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    senderTime = json['senderTime'];
    userId = json['userId'];
    isRead = json['isRead'];
    taksId = json['taksId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['senderTime'] = this.senderTime;
    data['userId'] = this.userId;
    data['isRead'] = this.isRead;
    data['taksId'] = this.taksId;
    return data;
  }
}
