part of 'super_admin_controller.dart';

@freezed
abstract class SuperAdminState with _$SuperAdminState {
  const SuperAdminState._();

  const factory SuperAdminState({
    String? email,
    String? name,
    UserTypeModel? userType,
    bool? isSaveClick,
  }) = _SuperAdminState;
}
