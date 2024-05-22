// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_company_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addCompanyUseCaseHash() => r'9dc3f1610307013e8f1fe07645d7a813f73d130f';

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

/// See also [addCompanyUseCase].
@ProviderFor(addCompanyUseCase)
const addCompanyUseCaseProvider = AddCompanyUseCaseFamily();

/// See also [addCompanyUseCase].
class AddCompanyUseCaseFamily extends Family<AsyncValue<AddTaskResponse>> {
  /// See also [addCompanyUseCase].
  const AddCompanyUseCaseFamily();

  /// See also [addCompanyUseCase].
  AddCompanyUseCaseProvider call({
    required String arabicName,
    required String englishName,
    required String address,
    required String managerId,
    required File? logo,
  }) {
    return AddCompanyUseCaseProvider(
      arabicName: arabicName,
      englishName: englishName,
      address: address,
      managerId: managerId,
      logo: logo,
    );
  }

  @override
  AddCompanyUseCaseProvider getProviderOverride(
    covariant AddCompanyUseCaseProvider provider,
  ) {
    return call(
      arabicName: provider.arabicName,
      englishName: provider.englishName,
      address: provider.address,
      managerId: provider.managerId,
      logo: provider.logo,
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
  String? get name => r'addCompanyUseCaseProvider';
}

/// See also [addCompanyUseCase].
class AddCompanyUseCaseProvider
    extends AutoDisposeFutureProvider<AddTaskResponse> {
  /// See also [addCompanyUseCase].
  AddCompanyUseCaseProvider({
    required String arabicName,
    required String englishName,
    required String address,
    required String managerId,
    required File? logo,
  }) : this._internal(
          (ref) => addCompanyUseCase(
            ref as AddCompanyUseCaseRef,
            arabicName: arabicName,
            englishName: englishName,
            address: address,
            managerId: managerId,
            logo: logo,
          ),
          from: addCompanyUseCaseProvider,
          name: r'addCompanyUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCompanyUseCaseHash,
          dependencies: AddCompanyUseCaseFamily._dependencies,
          allTransitiveDependencies:
              AddCompanyUseCaseFamily._allTransitiveDependencies,
          arabicName: arabicName,
          englishName: englishName,
          address: address,
          managerId: managerId,
          logo: logo,
        );

  AddCompanyUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arabicName,
    required this.englishName,
    required this.address,
    required this.managerId,
    required this.logo,
  }) : super.internal();

  final String arabicName;
  final String englishName;
  final String address;
  final String managerId;
  final File? logo;

  @override
  Override overrideWith(
    FutureOr<AddTaskResponse> Function(AddCompanyUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddCompanyUseCaseProvider._internal(
        (ref) => create(ref as AddCompanyUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arabicName: arabicName,
        englishName: englishName,
        address: address,
        managerId: managerId,
        logo: logo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AddTaskResponse> createElement() {
    return _AddCompanyUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddCompanyUseCaseProvider &&
        other.arabicName == arabicName &&
        other.englishName == englishName &&
        other.address == address &&
        other.managerId == managerId &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arabicName.hashCode);
    hash = _SystemHash.combine(hash, englishName.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, managerId.hashCode);
    hash = _SystemHash.combine(hash, logo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddCompanyUseCaseRef on AutoDisposeFutureProviderRef<AddTaskResponse> {
  /// The parameter `arabicName` of this provider.
  String get arabicName;

  /// The parameter `englishName` of this provider.
  String get englishName;

  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `managerId` of this provider.
  String get managerId;

  /// The parameter `logo` of this provider.
  File? get logo;
}

class _AddCompanyUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<AddTaskResponse>
    with AddCompanyUseCaseRef {
  _AddCompanyUseCaseProviderElement(super.provider);

  @override
  String get arabicName => (origin as AddCompanyUseCaseProvider).arabicName;
  @override
  String get englishName => (origin as AddCompanyUseCaseProvider).englishName;
  @override
  String get address => (origin as AddCompanyUseCaseProvider).address;
  @override
  String get managerId => (origin as AddCompanyUseCaseProvider).managerId;
  @override
  File? get logo => (origin as AddCompanyUseCaseProvider).logo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
