class CompanyModel {
  String? address;
  String? logo;
  String? managerId;
  String? nameEn;
  String? nameAr;
  int? id;
  bool? isDeleted;

  CompanyModel(
      {this.address,
      this.logo,
      this.managerId,
      this.nameEn,
      this.nameAr,
      this.id,
      this.isDeleted});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    logo = json['logo'];
    managerId = json['managerId'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    id = json['id'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['managerId'] = this.managerId;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['id'] = this.id;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
