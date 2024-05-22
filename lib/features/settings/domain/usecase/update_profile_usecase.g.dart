// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateProfileUseCaseHash() =>
    r'03c05544d5162e766d90b9425bb5179fcc2915f5';

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

/// See also [updateProfileUseCase].
@ProviderFor(updateProfileUseCase)
const updateProfileUseCaseProvider = UpdateProfileUseCaseFamily();

/// See also [updateProfileUseCase].
class UpdateProfileUseCaseFamily extends Family<AsyncValue<AuthResponse>> {
  /// See also [updateProfileUseCase].
  const UpdateProfileUseCaseFamily();

  /// See also [updateProfileUseCase].
  UpdateProfileUseCaseProvider call({
    File? avatar,
    String? userName,
    String? mobileNumber,
    String? email,
  }) {
    return UpdateProfileUseCaseProvider(
      avatar: avatar,
      userName: userName,
      mobileNumber: mobileNumber,
      email: email,
    );
  }

  @override
  UpdateProfileUseCaseProvider getProviderOverride(
    covariant UpdateProfileUseCaseProvider provider,
  ) {
    return call(
      avatar: provider.avatar,
      userName: provider.userName,
      mobileNumber: provider.mobileNumber,
      email: provider.email,
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
  String? get name => r'updateProfileUseCaseProvider';
}

/// See also [updateProfileUseCase].
class UpdateProfileUseCaseProvider
    extends AutoDisposeFutureProvider<AuthResponse> {
  /// See also [updateProfileUseCase].
  UpdateProfileUseCaseProvider({
    File? avatar,
    String? userName,
    String? mobileNumber,
    String? email,
  }) : this._internal(
          (ref) => updateProfileUseCase(
            ref as UpdateProfileUseCaseRef,
            avatar: avatar,
            userName: userName,
            mobileNumber: mobileNumber,
            email: email,
          ),
          from: updateProfileUseCaseProvider,
          name: r'updateProfileUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProfileUseCaseHash,
          dependencies: UpdateProfileUseCaseFamily._dependencies,
          allTransitiveDependencies:
              UpdateProfileUseCaseFamily._allTransitiveDependencies,
          avatar: avatar,
          userName: userName,
          mobileNumber: mobileNumber,
          email: email,
        );

  UpdateProfileUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.avatar,
    required this.userName,
    required this.mobileNumber,
    required this.email,
  }) : super.internal();

  final File? avatar;
  final String? userName;
  final String? mobileNumber;
  final String? email;

  @override
  Override overrideWith(
    FutureOr<AuthResponse> Function(UpdateProfileUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateProfileUseCaseProvider._internal(
        (ref) => create(ref as UpdateProfileUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        avatar: avatar,
        userName: userName,
        mobileNumber: mobileNumber,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AuthResponse> createElement() {
    return _UpdateProfileUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileUseCaseProvider &&
        other.avatar == avatar &&
        other.userName == userName &&
        other.mobileNumber == mobileNumber &&
        other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, avatar.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, mobileNumber.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateProfileUseCaseRef on AutoDisposeFutureProviderRef<AuthResponse> {
  /// The parameter `avatar` of this provider.
  File? get avatar;

  /// The parameter `userName` of this provider.
  String? get userName;

  /// The parameter `mobileNumber` of this provider.
  String? get mobileNumber;

  /// The parameter `email` of this provider.
  String? get email;
}

class _UpdateProfileUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<AuthResponse>
    with UpdateProfileUseCaseRef {
  _UpdateProfileUseCaseProviderElement(super.provider);

  @override
  File? get avatar => (origin as UpdateProfileUseCaseProvider).avatar;
  @override
  String? get userName => (origin as UpdateProfileUseCaseProvider).userName;
  @override
  String? get mobileNumber =>
      (origin as UpdateProfileUseCaseProvider).mobileNumber;
  @override
  String? get email => (origin as UpdateProfileUseCaseProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
