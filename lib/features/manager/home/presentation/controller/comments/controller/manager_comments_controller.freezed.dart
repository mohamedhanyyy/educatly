// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_comments_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManagerCommentsState {
  String? get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagerCommentsStateCopyWith<ManagerCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagerCommentsStateCopyWith<$Res> {
  factory $ManagerCommentsStateCopyWith(ManagerCommentsState value,
          $Res Function(ManagerCommentsState) then) =
      _$ManagerCommentsStateCopyWithImpl<$Res, ManagerCommentsState>;
  @useResult
  $Res call({String? comment});
}

/// @nodoc
class _$ManagerCommentsStateCopyWithImpl<$Res,
        $Val extends ManagerCommentsState>
    implements $ManagerCommentsStateCopyWith<$Res> {
  _$ManagerCommentsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ManagerCommentsStateImplCopyWith<$Res>
    implements $ManagerCommentsStateCopyWith<$Res> {
  factory _$$ManagerCommentsStateImplCopyWith(_$ManagerCommentsStateImpl value,
          $Res Function(_$ManagerCommentsStateImpl) then) =
      __$$ManagerCommentsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? comment});
}

/// @nodoc
class __$$ManagerCommentsStateImplCopyWithImpl<$Res>
    extends _$ManagerCommentsStateCopyWithImpl<$Res, _$ManagerCommentsStateImpl>
    implements _$$ManagerCommentsStateImplCopyWith<$Res> {
  __$$ManagerCommentsStateImplCopyWithImpl(_$ManagerCommentsStateImpl _value,
      $Res Function(_$ManagerCommentsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
  }) {
    return _then(_$ManagerCommentsStateImpl(
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ManagerCommentsStateImpl extends _ManagerCommentsState {
  const _$ManagerCommentsStateImpl({this.comment}) : super._();

  @override
  final String? comment;

  @override
  String toString() {
    return 'ManagerCommentsState(comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagerCommentsStateImpl &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagerCommentsStateImplCopyWith<_$ManagerCommentsStateImpl>
      get copyWith =>
          __$$ManagerCommentsStateImplCopyWithImpl<_$ManagerCommentsStateImpl>(
              this, _$identity);
}

abstract class _ManagerCommentsState extends ManagerCommentsState {
  const factory _ManagerCommentsState({final String? comment}) =
      _$ManagerCommentsStateImpl;
  const _ManagerCommentsState._() : super._();

  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$ManagerCommentsStateImplCopyWith<_$ManagerCommentsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
