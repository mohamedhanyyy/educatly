import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final String? role;
  final String? token;
  final String? userName;
  final String? fullName;
  final String? email;
  final id;
  final bool? firstLogin;

  AuthResponse(
      {required this.token,
      required this.role,
      required this.id,
      required this.fullName,
      required this.email,
      required this.firstLogin,
      required this.userName});

  @override
  List<Object?> get props =>
      [token, role, userName, email, id, firstLogin, fullName];

  Map<String, dynamic> toJson() => {
        'token': token,
        'role': role,
        'userName': userName,
        'fullName': fullName,
        'email': email,
        'id': id,
        'isFirstLogin': firstLogin,
      };

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      fullName: json['fullName'],
      role: json['role'],
      id: json['id'],
      email: json['email'],
      firstLogin: json['isFirstLogin'],
      userName: json['userName'],
    );
  }
}
