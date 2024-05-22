// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calender_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalenderState {
  DateTime get currentMonth => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalenderStateCopyWith<CalenderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalenderStateCopyWith<$Res> {
  factory $CalenderStateCopyWith(
          CalenderState value, $Res Function(CalenderState) then) =
      _$CalenderStateCopyWithImpl<$Res, CalenderState>;
  @useResult
  $Res call({DateTime currentMonth, DateTime selectedDate});
}

/// @nodoc
class _$CalenderStateCopyWithImpl<$Res, $Val extends CalenderState>
    implements $CalenderStateCopyWith<$Res> {
  _$CalenderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentMonth = null,
    Object? selectedDate = null,
  }) {
    return _then(_value.copyWith(
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalenderStateImplCopyWith<$Res>
    implements $CalenderStateCopyWith<$Res> {
  factory _$$CalenderStateImplCopyWith(
          _$CalenderStateImpl value, $Res Function(_$CalenderStateImpl) then) =
      __$$CalenderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime currentMonth, DateTime selectedDate});
}

/// @nodoc
class __$$CalenderStateImplCopyWithImpl<$Res>
    extends _$CalenderStateCopyWithImpl<$Res, _$CalenderStateImpl>
    implements _$$CalenderStateImplCopyWith<$Res> {
  __$$CalenderStateImplCopyWithImpl(
      _$CalenderStateImpl _value, $Res Function(_$CalenderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentMonth = null,
    Object? selectedDate = null,
  }) {
    return _then(_$CalenderStateImpl(
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CalenderStateImpl extends _CalenderState {
  const _$CalenderStateImpl(
      {required this.currentMonth, required this.selectedDate})
      : super._();

  @override
  final DateTime currentMonth;
  @override
  final DateTime selectedDate;

  @override
  String toString() {
    return 'CalenderState(currentMonth: $currentMonth, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalenderStateImpl &&
            (identical(other.currentMonth, currentMonth) ||
                other.currentMonth == currentMonth) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentMonth, selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      __$$CalenderStateImplCopyWithImpl<_$CalenderStateImpl>(this, _$identity);
}

abstract class _CalenderState extends CalenderState {
  const factory _CalenderState(
      {required final DateTime currentMonth,
      required final DateTime selectedDate}) = _$CalenderStateImpl;
  const _CalenderState._() : super._();

  @override
  DateTime get currentMonth;
  @override
  DateTime get selectedDate;
  @override
  @JsonKey(ignore: true)
  _$$CalenderStateImplCopyWith<_$CalenderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
