// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_password_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createPasswordUseCaseHash() =>
    r'7d3801b7a7c703429dcc5e28f50158927e5760fd';

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

/// See also [createPasswordUseCase].
@ProviderFor(createPasswordUseCase)
const createPasswordUseCaseProvider = CreatePasswordUseCaseFamily();

/// See also [createPasswordUseCase].
class CreatePasswordUseCaseFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [createPasswordUseCase].
  const CreatePasswordUseCaseFamily();

  /// See also [createPasswordUseCase].
  CreatePasswordUseCaseProvider call({
    required String email,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) {
    return CreatePasswordUseCaseProvider(
      email: email,
      oldPassword: oldPassword,
      newPassword: newPassword,
      newPasswordConfirm: newPasswordConfirm,
    );
  }

  @override
  CreatePasswordUseCaseProvider getProviderOverride(
    covariant CreatePasswordUseCaseProvider provider,
  ) {
    return call(
      email: provider.email,
      oldPassword: provider.oldPassword,
      newPassword: provider.newPassword,
      newPasswordConfirm: provider.newPasswordConfirm,
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
  String? get name => r'createPasswordUseCaseProvider';
}

/// See also [createPasswordUseCase].
class CreatePasswordUseCaseProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [createPasswordUseCase].
  CreatePasswordUseCaseProvider({
    required String email,
    required String oldPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) : this._internal(
          (ref) => createPasswordUseCase(
            ref as CreatePasswordUseCaseRef,
            email: email,
            oldPassword: oldPassword,
            newPassword: newPassword,
            newPasswordConfirm: newPasswordConfirm,
          ),
          from: createPasswordUseCaseProvider,
          name: r'createPasswordUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createPasswordUseCaseHash,
          dependencies: CreatePasswordUseCaseFamily._dependencies,
          allTransitiveDependencies:
              CreatePasswordUseCaseFamily._allTransitiveDependencies,
          email: email,
          oldPassword: oldPassword,
          newPassword: newPassword,
          newPasswordConfirm: newPasswordConfirm,
        );

  CreatePasswordUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirm,
  }) : super.internal();

  final String email;
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(CreatePasswordUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatePasswordUseCaseProvider._internal(
        (ref) => create(ref as CreatePasswordUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        oldPassword: oldPassword,
        newPassword: newPassword,
        newPasswordConfirm: newPasswordConfirm,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _CreatePasswordUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePasswordUseCaseProvider &&
        other.email == email &&
        other.oldPassword == oldPassword &&
        other.newPassword == newPassword &&
        other.newPasswordConfirm == newPasswordConfirm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, oldPassword.hashCode);
    hash = _SystemHash.combine(hash, newPassword.hashCode);
    hash = _SystemHash.combine(hash, newPasswordConfirm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreatePasswordUseCaseRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `oldPassword` of this provider.
  String get oldPassword;

  /// The parameter `newPassword` of this provider.
  String get newPassword;

  /// The parameter `newPasswordConfirm` of this provider.
  String get newPasswordConfirm;
}

class _CreatePasswordUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with CreatePasswordUseCaseRef {
  _CreatePasswordUseCaseProviderElement(super.provider);

  @override
  String get email => (origin as CreatePasswordUseCaseProvider).email;
  @override
  String get oldPassword =>
      (origin as CreatePasswordUseCaseProvider).oldPassword;
  @override
  String get newPassword =>
      (origin as CreatePasswordUseCaseProvider).newPassword;
  @override
  String get newPasswordConfirm =>
      (origin as CreatePasswordUseCaseProvider).newPasswordConfirm;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
