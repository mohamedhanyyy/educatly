// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'super_admin_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuperAdminState {
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  UserTypeModel? get userType => throw _privateConstructorUsedError;
  bool? get isSaveClick => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuperAdminStateCopyWith<SuperAdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuperAdminStateCopyWith<$Res> {
  factory $SuperAdminStateCopyWith(
          SuperAdminState value, $Res Function(SuperAdminState) then) =
      _$SuperAdminStateCopyWithImpl<$Res, SuperAdminState>;
  @useResult
  $Res call(
      {String? email,
      String? name,
      UserTypeModel? userType,
      bool? isSaveClick});
}

/// @nodoc
class _$SuperAdminStateCopyWithImpl<$Res, $Val extends SuperAdminState>
    implements $SuperAdminStateCopyWith<$Res> {
  _$SuperAdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? userType = freezed,
    Object? isSaveClick = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserTypeModel?,
      isSaveClick: freezed == isSaveClick
          ? _value.isSaveClick
          : isSaveClick // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuperAdminStateImplCopyWith<$Res>
    implements $SuperAdminStateCopyWith<$Res> {
  factory _$$SuperAdminStateImplCopyWith(_$SuperAdminStateImpl value,
          $Res Function(_$SuperAdminStateImpl) then) =
      __$$SuperAdminStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? name,
      UserTypeModel? userType,
      bool? isSaveClick});
}

/// @nodoc
class __$$SuperAdminStateImplCopyWithImpl<$Res>
    extends _$SuperAdminStateCopyWithImpl<$Res, _$SuperAdminStateImpl>
    implements _$$SuperAdminStateImplCopyWith<$Res> {
  __$$SuperAdminStateImplCopyWithImpl(
      _$SuperAdminStateImpl _value, $Res Function(_$SuperAdminStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? userType = freezed,
    Object? isSaveClick = freezed,
  }) {
    return _then(_$SuperAdminStateImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserTypeModel?,
      isSaveClick: freezed == isSaveClick
          ? _value.isSaveClick
          : isSaveClick // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SuperAdminStateImpl extends _SuperAdminState {
  const _$SuperAdminStateImpl(
      {this.email, this.name, this.userType, this.isSaveClick})
      : super._();

  @override
  final String? email;
  @override
  final String? name;
  @override
  final UserTypeModel? userType;
  @override
  final bool? isSaveClick;

  @override
  String toString() {
    return 'SuperAdminState(email: $email, name: $name, userType: $userType, isSaveClick: $isSaveClick)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperAdminStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isSaveClick, isSaveClick) ||
                other.isSaveClick == isSaveClick));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, userType, isSaveClick);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperAdminStateImplCopyWith<_$SuperAdminStateImpl> get copyWith =>
      __$$SuperAdminStateImplCopyWithImpl<_$SuperAdminStateImpl>(
          this, _$identity);
}

abstract class _SuperAdminState extends SuperAdminState {
  const factory _SuperAdminState(
      {final String? email,
      final String? name,
      final UserTypeModel? userType,
      final bool? isSaveClick}) = _$SuperAdminStateImpl;
  const _SuperAdminState._() : super._();

  @override
  String? get email;
  @override
  String? get name;
  @override
  UserTypeModel? get userType;
  @override
  bool? get isSaveClick;
  @override
  @JsonKey(ignore: true)
  _$$SuperAdminStateImplCopyWith<_$SuperAdminStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
