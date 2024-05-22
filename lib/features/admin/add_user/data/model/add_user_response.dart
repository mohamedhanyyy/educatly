import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_user_response.freezed.dart';
part 'add_user_response.g.dart';

@freezed
class AddUserResponse with _$AddUserResponse {
  const AddUserResponse._();

  const factory AddUserResponse(// required int statusId,
      // required int count,
      ) = _AddUserResponse;

  factory AddUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AddUserResponseFromJson(json);
}
