part of 'add_comment_controller.dart';

@freezed
abstract class AddCommentState with _$AddCommentState {
  const AddCommentState._();

  const factory AddCommentState({
    String? comment,
  }) = _AddCommentState;
}
