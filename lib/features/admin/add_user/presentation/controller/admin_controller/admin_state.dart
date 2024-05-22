part of 'admin_controller.dart';

@freezed
abstract class AdminState with _$AdminState {
  const AdminState._();

  const factory AdminState({
    String? email,
    List<String>? searchCompanyList,
    String? name,
    String? password,
    String? companyName,
    int? companyId,
    String? fullName,
    UserTypeModel? userType,
  }) = _AdminState;
}
