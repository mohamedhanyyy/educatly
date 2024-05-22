// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resendOtpUseCaseHash() => r'e630a4dfafdfc4594beef09766c5673d73042731';

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

/// See also [resendOtpUseCase].
@ProviderFor(resendOtpUseCase)
const resendOtpUseCaseProvider = ResendOtpUseCaseFamily();

/// See also [resendOtpUseCase].
class ResendOtpUseCaseFamily extends Family<AsyncValue<BaseResponse>> {
  /// See also [resendOtpUseCase].
  const ResendOtpUseCaseFamily();

  /// See also [resendOtpUseCase].
  ResendOtpUseCaseProvider call({
    required String email,
  }) {
    return ResendOtpUseCaseProvider(
      email: email,
    );
  }

  @override
  ResendOtpUseCaseProvider getProviderOverride(
    covariant ResendOtpUseCaseProvider provider,
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
  String? get name => r'resendOtpUseCaseProvider';
}

/// See also [resendOtpUseCase].
class ResendOtpUseCaseProvider extends AutoDisposeFutureProvider<BaseResponse> {
  /// See also [resendOtpUseCase].
  ResendOtpUseCaseProvider({
    required String email,
  }) : this._internal(
          (ref) => resendOtpUseCase(
            ref as ResendOtpUseCaseRef,
            email: email,
          ),
          from: resendOtpUseCaseProvider,
          name: r'resendOtpUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resendOtpUseCaseHash,
          dependencies: ResendOtpUseCaseFamily._dependencies,
          allTransitiveDependencies:
              ResendOtpUseCaseFamily._allTransitiveDependencies,
          email: email,
        );

  ResendOtpUseCaseProvider._internal(
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
    FutureOr<BaseResponse> Function(ResendOtpUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResendOtpUseCaseProvider._internal(
        (ref) => create(ref as ResendOtpUseCaseRef),
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
    return _ResendOtpUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResendOtpUseCaseProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ResendOtpUseCaseRef on AutoDisposeFutureProviderRef<BaseResponse> {
  /// The parameter `email` of this provider.
  String get email;
}

class _ResendOtpUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<BaseResponse>
    with ResendOtpUseCaseRef {
  _ResendOtpUseCaseProviderElement(super.provider);

  @override
  String get email => (origin as ResendOtpUseCaseProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
