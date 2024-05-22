// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Privacy _$PrivacyFromJson(Map<String, dynamic> json) {
  return _Privacy.fromJson(json);
}

/// @nodoc
mixin _$Privacy {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyCopyWith<Privacy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyCopyWith<$Res> {
  factory $PrivacyCopyWith(Privacy value, $Res Function(Privacy) then) =
      _$PrivacyCopyWithImpl<$Res, Privacy>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$PrivacyCopyWithImpl<$Res, $Val extends Privacy>
    implements $PrivacyCopyWith<$Res> {
  _$PrivacyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyImplCopyWith<$Res> implements $PrivacyCopyWith<$Res> {
  factory _$$PrivacyImplCopyWith(
          _$PrivacyImpl value, $Res Function(_$PrivacyImpl) then) =
      __$$PrivacyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$PrivacyImplCopyWithImpl<$Res>
    extends _$PrivacyCopyWithImpl<$Res, _$PrivacyImpl>
    implements _$$PrivacyImplCopyWith<$Res> {
  __$$PrivacyImplCopyWithImpl(
      _$PrivacyImpl _value, $Res Function(_$PrivacyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$PrivacyImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyImpl extends _Privacy {
  const _$PrivacyImpl({required this.title, required this.description})
      : super._();

  factory _$PrivacyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyImplFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'Privacy(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyImplCopyWith<_$PrivacyImpl> get copyWith =>
      __$$PrivacyImplCopyWithImpl<_$PrivacyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyImplToJson(
      this,
    );
  }
}

abstract class _Privacy extends Privacy {
  const factory _Privacy(
      {required final String title,
      required final String description}) = _$PrivacyImpl;
  const _Privacy._() : super._();

  factory _Privacy.fromJson(Map<String, dynamic> json) = _$PrivacyImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyImplCopyWith<_$PrivacyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
