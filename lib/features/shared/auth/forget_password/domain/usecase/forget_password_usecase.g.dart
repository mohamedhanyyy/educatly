// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$forgetPasswordUseCaseHash() =>
    r'bbf3f3e458784854e82683ddbfb25af797a2158c';

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

/// See also [forgetPasswordUseCase].
@ProviderFor(forgetPasswordUseCase)
const forgetPasswordUseCaseProvider = ForgetPasswordUseCaseFamily();

/// See also [forgetPasswordUseCase].
class ForgetPasswordUseCaseFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [forgetPasswordUseCase].
  const ForgetPasswordUseCaseFamily();

  /// See also [forgetPasswordUseCase].
  ForgetPasswordUseCaseProvider call({
    required String email,
  }) {
    return ForgetPasswordUseCaseProvider(
      email: email,
    );
  }

  @override
  ForgetPasswordUseCaseProvider getProviderOverride(
    covariant ForgetPasswordUseCaseProvider provider,
  ) {
    return call(
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
  String? get name => r'forgetPasswordUseCaseProvider';
}

/// See also [forgetPasswordUseCase].
class ForgetPasswordUseCaseProvider
    extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [forgetPasswordUseCase].
  ForgetPasswordUseCaseProvider({
    required String email,
  }) : this._internal(
          (ref) => forgetPasswordUseCase(
            ref as ForgetPasswordUseCaseRef,
            email: email,
          ),
          from: forgetPasswordUseCaseProvider,
          name: r'forgetPasswordUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forgetPasswordUseCaseHash,
          dependencies: ForgetPasswordUseCaseFamily._dependencies,
          allTransitiveDependencies:
              ForgetPasswordUseCaseFamily._allTransitiveDependencies,
          email: email,
        );

  ForgetPasswordUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<BaseResponse> Function(ForgetPasswordUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForgetPasswordUseCaseProvider._internal(
        (ref) => create(ref as ForgetPasswordUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BaseResponse> createElement() {
    return _ForgetPasswordUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForgetPasswordUseCaseProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ForgetPasswordUseCaseRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `email` of this provider.
  String get email;
}

class _ForgetPasswordUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with ForgetPasswordUseCaseRef {
  _ForgetPasswordUseCaseProviderElement(super.provider);

  @override
  String get email => (origin as ForgetPasswordUseCaseProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
