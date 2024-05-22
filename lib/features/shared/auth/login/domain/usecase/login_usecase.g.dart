// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginUseCaseHash() => r'fc57a4b24ca7236d8bf1c56cf2ca336a700a8b47';

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

/// See also [loginUseCase].
@ProviderFor(loginUseCase)
const loginUseCaseProvider = LoginUseCaseFamily();

/// See also [loginUseCase].
class LoginUseCaseFamily extends Family<AsyncValue<AuthResponse>> {
  /// See also [loginUseCase].
  const LoginUseCaseFamily();

  /// See also [loginUseCase].
  LoginUseCaseProvider call({
    required String username,
    required String password,
  }) {
    return LoginUseCaseProvider(
      username: username,
      password: password,
    );
  }

  @override
  LoginUseCaseProvider getProviderOverride(
    covariant LoginUseCaseProvider provider,
  ) {
    return call(
      username: provider.username,
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
  String? get name => r'loginUseCaseProvider';
}

/// See also [loginUseCase].
class LoginUseCaseProvider extends AutoDisposeFutureProvider<AuthResponse> {
  /// See also [loginUseCase].
  LoginUseCaseProvider({
    required String username,
    required String password,
  }) : this._internal(
          (ref) => loginUseCase(
            ref as LoginUseCaseRef,
            username: username,
            password: password,
          ),
          from: loginUseCaseProvider,
          name: r'loginUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginUseCaseHash,
          dependencies: LoginUseCaseFamily._dependencies,
          allTransitiveDependencies:
              LoginUseCaseFamily._allTransitiveDependencies,
          username: username,
          password: password,
        );

  LoginUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.password,
  }) : super.internal();

  final String username;
  final String password;

  @override
  Override overrideWith(
    FutureOr<AuthResponse> Function(LoginUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginUseCaseProvider._internal(
        (ref) => create(ref as LoginUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AuthResponse> createElement() {
    return _LoginUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginUseCaseProvider &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginUseCaseRef on AutoDisposeFutureProviderRef<AuthResponse> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `password` of this provider.
  String get password;
}

class _LoginUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<AuthResponse>
    with LoginUseCaseRef {
  _LoginUseCaseProviderElement(super.provider);

  @override
  String get username => (origin as LoginUseCaseProvider).username;
  @override
  String get password => (origin as LoginUseCaseProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
