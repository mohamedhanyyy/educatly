// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) {
  return _StatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticsModel {
  int get id => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res, StatisticsModel>;
  @useResult
  $Res call({int id, int color, String icon});
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res, $Val extends StatisticsModel>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsModelImplCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$$StatisticsModelImplCopyWith(_$StatisticsModelImpl value,
          $Res Function(_$StatisticsModelImpl) then) =
      __$$StatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int color, String icon});
}

/// @nodoc
class __$$StatisticsModelImplCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res, _$StatisticsModelImpl>
    implements _$$StatisticsModelImplCopyWith<$Res> {
  __$$StatisticsModelImplCopyWithImpl(
      _$StatisticsModelImpl _value, $Res Function(_$StatisticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
    Object? icon = null,
  }) {
    return _then(_$StatisticsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsModelImpl extends _StatisticsModel {
  const _$StatisticsModelImpl(
      {required this.id, required this.color, required this.icon})
      : super._();

  factory _$StatisticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsModelImplFromJson(json);

  @override
  final int id;
  @override
  final int color;
  @override
  final String icon;

  @override
  String toString() {
    return 'StatisticsModel(id: $id, color: $color, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, color, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      __$$StatisticsModelImplCopyWithImpl<_$StatisticsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsModelImplToJson(
      this,
    );
  }
}

abstract class _StatisticsModel extends StatisticsModel {
  const factory _StatisticsModel(
      {required final int id,
      required final int color,
      required final String icon}) = _$StatisticsModelImpl;
  const _StatisticsModel._() : super._();

  factory _StatisticsModel.fromJson(Map<String, dynamic> json) =
      _$StatisticsModelImpl.fromJson;

  @override
  int get id;
  @override
  int get color;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
