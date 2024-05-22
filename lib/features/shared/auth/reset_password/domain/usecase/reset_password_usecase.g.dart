// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resetPasswordUseCaseHash() =>
    r'69ded85339b3b63c9a3a21a5873e8b33ba58c4d2';

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

/// See also [resetPasswordUseCase].
@ProviderFor(resetPasswordUseCase)
const resetPasswordUseCaseProvider = ResetPasswordUseCaseFamily();

/// See also [resetPasswordUseCase].
class ResetPasswordUseCaseFamily extends Family<AsyncValue<AuthResponse>> {
  /// See also [resetPasswordUseCase].
  const ResetPasswordUseCaseFamily();

  /// See also [resetPasswordUseCase].
  ResetPasswordUseCaseProvider call({
    required String email,
    required String password,
    required String confirmPassword,
    required String resetPasswordToken,
  }) {
    return ResetPasswordUseCaseProvider(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      resetPasswordToken: resetPasswordToken,
    );
  }

  @override
  ResetPasswordUseCaseProvider getProviderOverride(
    covariant ResetPasswordUseCaseProvider provider,
  ) {
    return call(
      email: provider.email,
      password: provider.password,
      confirmPassword: provider.confirmPassword,
      resetPasswordToken: provider.resetPasswordToken,
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
  String? get name => r'resetPasswordUseCaseProvider';
}

/// See also [resetPasswordUseCase].
class ResetPasswordUseCaseProvider
    extends AutoDisposeFutureProvider<AuthResponse> {
  /// See also [resetPasswordUseCase].
  ResetPasswordUseCaseProvider({
    required String email,
    required String password,
    required String confirmPassword,
    required String resetPasswordToken,
  }) : this._internal(
          (ref) => resetPasswordUseCase(
            ref as ResetPasswordUseCaseRef,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            resetPasswordToken: resetPasswordToken,
          ),
          from: resetPasswordUseCaseProvider,
          name: r'resetPasswordUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resetPasswordUseCaseHash,
          dependencies: ResetPasswordUseCaseFamily._dependencies,
          allTransitiveDependencies:
              ResetPasswordUseCaseFamily._allTransitiveDependencies,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          resetPasswordToken: resetPasswordToken,
        );

  ResetPasswordUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.resetPasswordToken,
  }) : super.internal();

  final String email;
  final String password;
  final String confirmPassword;
  final String resetPasswordToken;

  @override
  Override overrideWith(
    FutureOr<AuthResponse> Function(ResetPasswordUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResetPasswordUseCaseProvider._internal(
        (ref) => create(ref as ResetPasswordUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        resetPasswordToken: resetPasswordToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AuthResponse> createElement() {
    return _ResetPasswordUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordUseCaseProvider &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.resetPasswordToken == resetPasswordToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, confirmPassword.hashCode);
    hash = _SystemHash.combine(hash, resetPasswordToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResetPasswordUseCaseRef on AutoDisposeFutureProviderRef<AuthResponse> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `confirmPassword` of this provider.
  String get confirmPassword;

  /// The parameter `resetPasswordToken` of this provider.
  String get resetPasswordToken;
}

class _ResetPasswordUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<AuthResponse>
    with ResetPasswordUseCaseRef {
  _ResetPasswordUseCaseProviderElement(super.provider);

  @override
  String get email => (origin as ResetPasswordUseCaseProvider).email;
  @override
  String get password => (origin as ResetPasswordUseCaseProvider).password;
  @override
  String get confirmPassword =>
      (origin as ResetPasswordUseCaseProvider).confirmPassword;
  @override
  String get resetPasswordToken =>
      (origin as ResetPasswordUseCaseProvider).resetPasswordToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
