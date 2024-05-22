import 'package:taskaty/features/shared/auth/login/data/model/auth_response.dart';

class LoginModel {
  AuthResponse? data;
  List<String>? errors;
  List<String>? successMessages;
  int? statusCode;
  bool? success;
  bool? hasException;

  LoginModel(
      {this.data,
      this.errors,
      this.successMessages,
      this.statusCode,
      this.success,
      this.hasException});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new AuthResponse.fromJson(json['data']) : null;
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
