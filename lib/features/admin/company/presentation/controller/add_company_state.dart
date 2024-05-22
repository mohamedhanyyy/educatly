part of 'add_company_controller.dart';

@freezed
abstract class AddCompanyState with _$AddCompanyState {
  const AddCompanyState._();

  const factory AddCompanyState({
    ManagerModel? selectedManager,
    int? selectedAssigneToIndex,
    List<ManagerModel>? searchManagerList,
  }) = _AddCompanyState;
}
