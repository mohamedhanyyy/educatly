// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_comment_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCommentState {
  String? get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCommentStateCopyWith<AddCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCommentStateCopyWith<$Res> {
  factory $AddCommentStateCopyWith(
          AddCommentState value, $Res Function(AddCommentState) then) =
      _$AddCommentStateCopyWithImpl<$Res, AddCommentState>;
  @useResult
  $Res call({String? comment});
}

/// @nodoc
class _$AddCommentStateCopyWithImpl<$Res, $Val extends AddCommentState>
    implements $AddCommentStateCopyWith<$Res> {
  _$AddCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCommentStateImplCopyWith<$Res>
    implements $AddCommentStateCopyWith<$Res> {
  factory _$$AddCommentStateImplCopyWith(_$AddCommentStateImpl value,
          $Res Function(_$AddCommentStateImpl) then) =
      __$$AddCommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? comment});
}

/// @nodoc
class __$$AddCommentStateImplCopyWithImpl<$Res>
    extends _$AddCommentStateCopyWithImpl<$Res, _$AddCommentStateImpl>
    implements _$$AddCommentStateImplCopyWith<$Res> {
  __$$AddCommentStateImplCopyWithImpl(
      _$AddCommentStateImpl _value, $Res Function(_$AddCommentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
  }) {
    return _then(_$AddCommentStateImpl(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddCommentStateImpl extends _AddCommentState {
  const _$AddCommentStateImpl({this.comment}) : super._();

  @override
  final String? comment;

  @override
  String toString() {
    return 'AddCommentState(comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCommentStateImpl &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCommentStateImplCopyWith<_$AddCommentStateImpl> get copyWith =>
      __$$AddCommentStateImplCopyWithImpl<_$AddCommentStateImpl>(
          this, _$identity);
}

abstract class _AddCommentState extends AddCommentState {
  const factory _AddCommentState({final String? comment}) =
      _$AddCommentStateImpl;
  const _AddCommentState._() : super._();

  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$AddCommentStateImplCopyWith<_$AddCommentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
