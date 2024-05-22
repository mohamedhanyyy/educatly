// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_admin_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$superAdminUseCaseHash() => r'df97960e9697af6148da05cb4f985b61f9ab2335';

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

/// See also [superAdminUseCase].
@ProviderFor(superAdminUseCase)
const superAdminUseCaseProvider = SuperAdminUseCaseFamily();

/// See also [superAdminUseCase].
class SuperAdminUseCaseFamily extends Family<AsyncValue<AddUserResponse>> {
  /// See also [superAdminUseCase].
  const SuperAdminUseCaseFamily();

  /// See also [superAdminUseCase].
  SuperAdminUseCaseProvider call({
    required String userName,
    String? fullName,
    required String email,
    required int role,
    required String password,
  }) {
    return SuperAdminUseCaseProvider(
      userName: userName,
      fullName: fullName,
      email: email,
      role: role,
      password: password,
    );
  }

  @override
  SuperAdminUseCaseProvider getProviderOverride(
    covariant SuperAdminUseCaseProvider provider,
  ) {
    return call(
      userName: provider.userName,
      fullName: provider.fullName,
      email: provider.email,
      role: provider.role,
      password: provider.password,
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
  String? get name => r'superAdminUseCaseProvider';
}

/// See also [superAdminUseCase].
class SuperAdminUseCaseProvider
    extends AutoDisposeFutureProvider<AddUserResponse> {
  /// See also [superAdminUseCase].
  SuperAdminUseCaseProvider({
    required String userName,
    String? fullName,
    required String email,
    required int role,
    required String password,
  }) : this._internal(
          (ref) => superAdminUseCase(
            ref as SuperAdminUseCaseRef,
            userName: userName,
            fullName: fullName,
            email: email,
            role: role,
            password: password,
          ),
          from: superAdminUseCaseProvider,
          name: r'superAdminUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$superAdminUseCaseHash,
          dependencies: SuperAdminUseCaseFamily._dependencies,
          allTransitiveDependencies:
              SuperAdminUseCaseFamily._allTransitiveDependencies,
          userName: userName,
          fullName: fullName,
          email: email,
          role: role,
          password: password,
        );

  SuperAdminUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.role,
    required this.password,
  }) : super.internal();

  final String userName;
  final String? fullName;
  final String email;
  final int role;
  final String password;

  @override
  Override overrideWith(
    FutureOr<AddUserResponse> Function(SuperAdminUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SuperAdminUseCaseProvider._internal(
        (ref) => create(ref as SuperAdminUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        fullName: fullName,
        email: email,
        role: role,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AddUserResponse> createElement() {
    return _SuperAdminUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SuperAdminUseCaseProvider &&
        other.userName == userName &&
        other.fullName == fullName &&
        other.email == email &&
        other.role == role &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SuperAdminUseCaseRef on AutoDisposeFutureProviderRef<AddUserResponse> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `fullName` of this provider.
  String? get fullName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `role` of this provider.
  int get role;

  /// The parameter `password` of this provider.
  String get password;
}

class _SuperAdminUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<AddUserResponse>
    with SuperAdminUseCaseRef {
  _SuperAdminUseCaseProviderElement(super.provider);

  @override
  String get userName => (origin as SuperAdminUseCaseProvider).userName;
  @override
  String? get fullName => (origin as SuperAdminUseCaseProvider).fullName;
  @override
  String get email => (origin as SuperAdminUseCaseProvider).email;
  @override
  int get role => (origin as SuperAdminUseCaseProvider).role;
  @override
  String get password => (origin as SuperAdminUseCaseProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
