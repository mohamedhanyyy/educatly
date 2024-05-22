// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updatePasswordUseCaseHash() =>
    r'f31b8322cd1ac94a38bf60348530bf76311f18b0';

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

/// See also [updatePasswordUseCase].
@ProviderFor(updatePasswordUseCase)
const updatePasswordUseCaseProvider = UpdatePasswordUseCaseFamily();

/// See also [updatePasswordUseCase].
class UpdatePasswordUseCaseFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [updatePasswordUseCase].
  const UpdatePasswordUseCaseFamily();

  /// See also [updatePasswordUseCase].
  UpdatePasswordUseCaseProvider call({
    required String userName,
    required String newPass,
    required String currentPass,
  }) {
    return UpdatePasswordUseCaseProvider(
      userName: userName,
      newPass: newPass,
      currentPass: currentPass,
    );
  }

  @override
  UpdatePasswordUseCaseProvider getProviderOverride(
    covariant UpdatePasswordUseCaseProvider provider,
  ) {
    return call(
      userName: provider.userName,
      newPass: provider.newPass,
      currentPass: provider.currentPass,
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
  String? get name => r'updatePasswordUseCaseProvider';
}

/// See also [updatePasswordUseCase].
class UpdatePasswordUseCaseProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [updatePasswordUseCase].
  UpdatePasswordUseCaseProvider({
    required String userName,
    required String newPass,
    required String currentPass,
  }) : this._internal(
          (ref) => updatePasswordUseCase(
            ref as UpdatePasswordUseCaseRef,
            userName: userName,
            newPass: newPass,
            currentPass: currentPass,
          ),
          from: updatePasswordUseCaseProvider,
          name: r'updatePasswordUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePasswordUseCaseHash,
          dependencies: UpdatePasswordUseCaseFamily._dependencies,
          allTransitiveDependencies:
              UpdatePasswordUseCaseFamily._allTransitiveDependencies,
          userName: userName,
          newPass: newPass,
          currentPass: currentPass,
        );

  UpdatePasswordUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.newPass,
    required this.currentPass,
  }) : super.internal();

  final String userName;
  final String newPass;
  final String currentPass;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(UpdatePasswordUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePasswordUseCaseProvider._internal(
        (ref) => create(ref as UpdatePasswordUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        newPass: newPass,
        currentPass: currentPass,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _UpdatePasswordUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePasswordUseCaseProvider &&
        other.userName == userName &&
        other.newPass == newPass &&
        other.currentPass == currentPass;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, newPass.hashCode);
    hash = _SystemHash.combine(hash, currentPass.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdatePasswordUseCaseRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `newPass` of this provider.
  String get newPass;

  /// The parameter `currentPass` of this provider.
  String get currentPass;
}

class _UpdatePasswordUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with UpdatePasswordUseCaseRef {
  _UpdatePasswordUseCaseProviderElement(super.provider);

  @override
  String get userName => (origin as UpdatePasswordUseCaseProvider).userName;
  @override
  String get newPass => (origin as UpdatePasswordUseCaseProvider).newPass;
  @override
  String get currentPass =>
      (origin as UpdatePasswordUseCaseProvider).currentPass;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
