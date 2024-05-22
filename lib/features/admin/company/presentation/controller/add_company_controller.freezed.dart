// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_company_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCompanyState {
  ManagerModel? get selectedManager => throw _privateConstructorUsedError;
  int? get selectedAssigneToIndex => throw _privateConstructorUsedError;
  List<ManagerModel>? get searchManagerList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCompanyStateCopyWith<AddCompanyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCompanyStateCopyWith<$Res> {
  factory $AddCompanyStateCopyWith(
          AddCompanyState value, $Res Function(AddCompanyState) then) =
      _$AddCompanyStateCopyWithImpl<$Res, AddCompanyState>;
  @useResult
  $Res call(
      {ManagerModel? selectedManager,
      int? selectedAssigneToIndex,
      List<ManagerModel>? searchManagerList});
}

/// @nodoc
class _$AddCompanyStateCopyWithImpl<$Res, $Val extends AddCompanyState>
    implements $AddCompanyStateCopyWith<$Res> {
  _$AddCompanyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedManager = freezed,
    Object? selectedAssigneToIndex = freezed,
    Object? searchManagerList = freezed,
  }) {
    return _then(_value.copyWith(
      selectedManager: freezed == selectedManager
          ? _value.selectedManager
          : selectedManager // ignore: cast_nullable_to_non_nullable
              as ManagerModel?,
      selectedAssigneToIndex: freezed == selectedAssigneToIndex
          ? _value.selectedAssigneToIndex
          : selectedAssigneToIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      searchManagerList: freezed == searchManagerList
          ? _value.searchManagerList
          : searchManagerList // ignore: cast_nullable_to_non_nullable
              as List<ManagerModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCompanyStateImplCopyWith<$Res>
    implements $AddCompanyStateCopyWith<$Res> {
  factory _$$AddCompanyStateImplCopyWith(_$AddCompanyStateImpl value,
          $Res Function(_$AddCompanyStateImpl) then) =
      __$$AddCompanyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ManagerModel? selectedManager,
      int? selectedAssigneToIndex,
      List<ManagerModel>? searchManagerList});
}

/// @nodoc
class __$$AddCompanyStateImplCopyWithImpl<$Res>
    extends _$AddCompanyStateCopyWithImpl<$Res, _$AddCompanyStateImpl>
    implements _$$AddCompanyStateImplCopyWith<$Res> {
  __$$AddCompanyStateImplCopyWithImpl(
      _$AddCompanyStateImpl _value, $Res Function(_$AddCompanyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedManager = freezed,
    Object? selectedAssigneToIndex = freezed,
    Object? searchManagerList = freezed,
  }) {
    return _then(_$AddCompanyStateImpl(
      selectedManager: freezed == selectedManager
          ? _value.selectedManager
          : selectedManager // ignore: cast_nullable_to_non_nullable
              as ManagerModel?,
      selectedAssigneToIndex: freezed == selectedAssigneToIndex
          ? _value.selectedAssigneToIndex
          : selectedAssigneToIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      searchManagerList: freezed == searchManagerList
          ? _value._searchManagerList
          : searchManagerList // ignore: cast_nullable_to_non_nullable
              as List<ManagerModel>?,
    ));
  }
}

/// @nodoc

class _$AddCompanyStateImpl extends _AddCompanyState {
  const _$AddCompanyStateImpl(
      {this.selectedManager,
      this.selectedAssigneToIndex,
      final List<ManagerModel>? searchManagerList})
      : _searchManagerList = searchManagerList,
        super._();

  @override
  final ManagerModel? selectedManager;
  @override
  final int? selectedAssigneToIndex;
  final List<ManagerModel>? _searchManagerList;
  @override
  List<ManagerModel>? get searchManagerList {
    final value = _searchManagerList;
    if (value == null) return null;
    if (_searchManagerList is EqualUnmodifiableListView)
      return _searchManagerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddCompanyState(selectedManager: $selectedManager, selectedAssigneToIndex: $selectedAssigneToIndex, searchManagerList: $searchManagerList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCompanyStateImpl &&
            (identical(other.selectedManager, selectedManager) ||
                other.selectedManager == selectedManager) &&
            (identical(other.selectedAssigneToIndex, selectedAssigneToIndex) ||
                other.selectedAssigneToIndex == selectedAssigneToIndex) &&
            const DeepCollectionEquality()
                .equals(other._searchManagerList, _searchManagerList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedManager,
      selectedAssigneToIndex,
      const DeepCollectionEquality().hash(_searchManagerList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCompanyStateImplCopyWith<_$AddCompanyStateImpl> get copyWith =>
      __$$AddCompanyStateImplCopyWithImpl<_$AddCompanyStateImpl>(
          this, _$identity);
}

abstract class _AddCompanyState extends AddCompanyState {
  const factory _AddCompanyState(
      {final ManagerModel? selectedManager,
      final int? selectedAssigneToIndex,
      final List<ManagerModel>? searchManagerList}) = _$AddCompanyStateImpl;
  const _AddCompanyState._() : super._();

  @override
  ManagerModel? get selectedManager;
  @override
  int? get selectedAssigneToIndex;
  @override
  List<ManagerModel>? get searchManagerList;
  @override
  @JsonKey(ignore: true)
  _$$AddCompanyStateImplCopyWith<_$AddCompanyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
