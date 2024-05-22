class ManagerModel {
  String? id;
  String? userName;
  String? imageName;

  ManagerModel({this.id, this.userName, this.imageName});

  ManagerModel.fromJson(Map<String, dynamic> json) {
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
