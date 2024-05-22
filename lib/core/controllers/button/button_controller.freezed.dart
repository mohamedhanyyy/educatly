// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ButtonState {
  Key? get key => throw _privateConstructorUsedError;
  ButtonStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ButtonStateCopyWith<ButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonStateCopyWith<$Res> {
  factory $ButtonStateCopyWith(
          ButtonState value, $Res Function(ButtonState) then) =
      _$ButtonStateCopyWithImpl<$Res, ButtonState>;
  @useResult
  $Res call({Key? key, ButtonStatus status});
}

/// @nodoc
class _$ButtonStateCopyWithImpl<$Res, $Val extends ButtonState>
    implements $ButtonStateCopyWith<$Res> {
  _$ButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ButtonStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ButtonStateImplCopyWith<$Res>
    implements $ButtonStateCopyWith<$Res> {
  factory _$$ButtonStateImplCopyWith(
          _$ButtonStateImpl value, $Res Function(_$ButtonStateImpl) then) =
      __$$ButtonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Key? key, ButtonStatus status});
}

/// @nodoc
class __$$ButtonStateImplCopyWithImpl<$Res>
    extends _$ButtonStateCopyWithImpl<$Res, _$ButtonStateImpl>
    implements _$$ButtonStateImplCopyWith<$Res> {
  __$$ButtonStateImplCopyWithImpl(
      _$ButtonStateImpl _value, $Res Function(_$ButtonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? status = null,
  }) {
    return _then(_$ButtonStateImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ButtonStatus,
    ));
  }
}

/// @nodoc

class _$ButtonStateImpl extends _ButtonState {
  const _$ButtonStateImpl({this.key = null, this.status = ButtonStatus.initial})
      : super._();

  @override
  @JsonKey()
  final Key? key;
  @override
  @JsonKey()
  final ButtonStatus status;

  @override
  String toString() {
    return 'ButtonState(key: $key, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonStateImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonStateImplCopyWith<_$ButtonStateImpl> get copyWith =>
      __$$ButtonStateImplCopyWithImpl<_$ButtonStateImpl>(this, _$identity);
}

abstract class _ButtonState extends ButtonState {
  const factory _ButtonState({final Key? key, final ButtonStatus status}) =
      _$ButtonStateImpl;
  const _ButtonState._() : super._();

  @override
  Key? get key;
  @override
  ButtonStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$ButtonStateImplCopyWith<_$ButtonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
