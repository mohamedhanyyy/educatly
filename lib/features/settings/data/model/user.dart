// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';
//
// part 'user.freezed.dart';
// part 'user.g.dart';
//
// @freezed
// abstract class User extends HiveObject with _$User {
//   User._();
//
//   @HiveType(typeId: 0, adapterName: 'UserAdapter')
//   factory User({
//     @HiveField(1) required String email,
//     @HiveField(2) required String userName,
//     @HiveField(3) required String? name,
//     @HiveField(4) required String? image,
//     @HiveField(5) required String? phoneNumber,
//   }) = _User;
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
