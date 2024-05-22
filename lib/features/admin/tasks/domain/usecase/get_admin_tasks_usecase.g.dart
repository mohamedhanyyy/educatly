// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_admin_tasks_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAdminTasksUsecaseHash() =>
    r'c3cd8d0f9e9baf0b8e51fca620f2dba61a0303cf';

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

/// See also [getAdminTasksUsecase].
@ProviderFor(getAdminTasksUsecase)
const getAdminTasksUsecaseProvider = GetAdminTasksUsecaseFamily();

/// See also [getAdminTasksUsecase].
class GetAdminTasksUsecaseFamily
    extends Family<AsyncValue<List<AdminTasksModel>>> {
  /// See also [getAdminTasksUsecase].
  const GetAdminTasksUsecaseFamily();

  /// See also [getAdminTasksUsecase].
  GetAdminTasksUsecaseProvider call({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    int? page,
    String? searchText,
    ManagerModel? selectedManager,
  }) {
    return GetAdminTasksUsecaseProvider(
      startDate: startDate,
      endDate: endDate,
      selectedPriorityId: selectedPriorityId,
      selectedStatusId: selectedStatusId,
      page: page,
      searchText: searchText,
      selectedManager: selectedManager,
    );
  }

  @override
  GetAdminTasksUsecaseProvider getProviderOverride(
    covariant GetAdminTasksUsecaseProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      selectedPriorityId: provider.selectedPriorityId,
      selectedStatusId: provider.selectedStatusId,
      page: provider.page,
      searchText: provider.searchText,
      selectedManager: provider.selectedManager,
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
  String? get name => r'getAdminTasksUsecaseProvider';
}

/// See also [getAdminTasksUsecase].
class GetAdminTasksUsecaseProvider
    extends AutoDisposeFutureProvider<List<AdminTasksModel>> {
  /// See also [getAdminTasksUsecase].
  GetAdminTasksUsecaseProvider({
    DateTime? startDate,
    DateTime? endDate,
    int? selectedPriorityId,
    int? selectedStatusId,
    int? page,
    String? searchText,
    ManagerModel? selectedManager,
  }) : this._internal(
          (ref) => getAdminTasksUsecase(
            ref as GetAdminTasksUsecaseRef,
            startDate: startDate,
            endDate: endDate,
            selectedPriorityId: selectedPriorityId,
            selectedStatusId: selectedStatusId,
            page: page,
            searchText: searchText,
            selectedManager: selectedManager,
          ),
          from: getAdminTasksUsecaseProvider,
          name: r'getAdminTasksUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAdminTasksUsecaseHash,
          dependencies: GetAdminTasksUsecaseFamily._dependencies,
          allTransitiveDependencies:
              GetAdminTasksUsecaseFamily._allTransitiveDependencies,
          startDate: startDate,
          endDate: endDate,
          selectedPriorityId: selectedPriorityId,
          selectedStatusId: selectedStatusId,
          page: page,
          searchText: searchText,
          selectedManager: selectedManager,
        );

  GetAdminTasksUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.selectedPriorityId,
    required this.selectedStatusId,
    required this.page,
    required this.searchText,
    required this.selectedManager,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;
  final int? selectedPriorityId;
  final int? selectedStatusId;
  final int? page;
  final String? searchText;
  final ManagerModel? selectedManager;

  @override
  Override overrideWith(
    FutureOr<List<AdminTasksModel>> Function(GetAdminTasksUsecaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAdminTasksUsecaseProvider._internal(
        (ref) => create(ref as GetAdminTasksUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        selectedPriorityId: selectedPriorityId,
        selectedStatusId: selectedStatusId,
        page: page,
        searchText: searchText,
        selectedManager: selectedManager,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AdminTasksModel>> createElement() {
    return _GetAdminTasksUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAdminTasksUsecaseProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.selectedPriorityId == selectedPriorityId &&
        other.selectedStatusId == selectedStatusId &&
        other.page == page &&
        other.searchText == searchText &&
        other.selectedManager == selectedManager;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, selectedPriorityId.hashCode);
    hash = _SystemHash.combine(hash, selectedStatusId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);
    hash = _SystemHash.combine(hash, selectedManager.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAdminTasksUsecaseRef
    on AutoDisposeFutureProviderRef<List<AdminTasksModel>> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `selectedPriorityId` of this provider.
  int? get selectedPriorityId;

  /// The parameter `selectedStatusId` of this provider.
  int? get selectedStatusId;

  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `searchText` of this provider.
  String? get searchText;

  /// The parameter `selectedManager` of this provider.
  ManagerModel? get selectedManager;
}

class _GetAdminTasksUsecaseProviderElement
    extends AutoDisposeFutureProviderElement<List<AdminTasksModel>>
    with GetAdminTasksUsecaseRef {
  _GetAdminTasksUsecaseProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as GetAdminTasksUsecaseProvider).startDate;
  @override
  DateTime? get endDate => (origin as GetAdminTasksUsecaseProvider).endDate;
  @override
  int? get selectedPriorityId =>
      (origin as GetAdminTasksUsecaseProvider).selectedPriorityId;
  @override
  int? get selectedStatusId =>
      (origin as GetAdminTasksUsecaseProvider).selectedStatusId;
  @override
  int? get page => (origin as GetAdminTasksUsecaseProvider).page;
  @override
  String? get searchText => (origin as GetAdminTasksUsecaseProvider).searchText;
  @override
  ManagerModel? get selectedManager =>
      (origin as GetAdminTasksUsecaseProvider).selectedManager;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
