part of 'manager_comments_controller.dart';

@freezed
abstract class ManagerCommentsState with _$ManagerCommentsState {
  const ManagerCommentsState._();

  const factory ManagerCommentsState({
    String? comment,
  }) = _ManagerCommentsState;
}
