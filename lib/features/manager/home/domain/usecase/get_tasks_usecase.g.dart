// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tasks_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTasksUseCaseHash() => r'7ba0dcc8adef624f780f46608844b8fc23a5cfda';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getTasksUseCase].
@ProviderFor(getTasksUseCase)
const getTasksUseCaseProvider = GetTasksUseCaseFamily();

/// See also [getTasksUseCase].
class GetTasksUseCaseFamily extends Family<AsyncValue<List<AdminTasksModel>>> {
  /// See also [getTasksUseCase].
  const GetTasksUseCaseFamily();

  /// See also [getTasksUseCase].
  GetTasksUseCaseProvider call({
    int? filter,
    DateTime? date,
  }) {
    return GetTasksUseCaseProvider(
      filter: filter,
      date: date,
    );
  }

  @override
  GetTasksUseCaseProvider getProviderOverride(
    covariant GetTasksUseCaseProvider provider,
  ) {
    return call(
      filter: provider.filter,
      date: provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTasksUseCaseProvider';
}

/// See also [getTasksUseCase].
class GetTasksUseCaseProvider
    extends AutoDisposeFutureProvider<List<AdminTasksModel>> {
  /// See also [getTasksUseCase].
  GetTasksUseCaseProvider({
    int? filter,
    DateTime? date,
  }) : this._internal(
          (ref) => getTasksUseCase(
            ref as GetTasksUseCaseRef,
            filter: filter,
            date: date,
          ),
          from: getTasksUseCaseProvider,
          name: r'getTasksUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTasksUseCaseHash,
          dependencies: GetTasksUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetTasksUseCaseFamily._allTransitiveDependencies,
          filter: filter,
          date: date,
        );

  GetTasksUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
    required this.date,
  }) : super.internal();

  final int? filter;
  final DateTime? date;

  @override
  Override overrideWith(
    FutureOr<List<AdminTasksModel>> Function(GetTasksUseCaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTasksUseCaseProvider._internal(
        (ref) => create(ref as GetTasksUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AdminTasksModel>> createElement() {
    return _GetTasksUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTasksUseCaseProvider &&
        other.filter == filter &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTasksUseCaseRef
    on AutoDisposeFutureProviderRef<List<AdminTasksModel>> {
  /// The parameter `filter` of this provider.
  int? get filter;

  /// The parameter `date` of this provider.
  DateTime? get date;
}

class _GetTasksUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<List<AdminTasksModel>>
    with GetTasksUseCaseRef {
  _GetTasksUseCaseProviderElement(super.provider);

  @override
  int? get filter => (origin as GetTasksUseCaseProvider).filter;
  @override
  DateTime? get date => (origin as GetTasksUseCaseProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
