// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyOtpUseCaseHash() => r'8d3c44d5984b4c34af9cde0161ebea14837ba4be';

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

/// See also [verifyOtpUseCase].
@ProviderFor(verifyOtpUseCase)
const verifyOtpUseCaseProvider = VerifyOtpUseCaseFamily();

/// See also [verifyOtpUseCase].
class VerifyOtpUseCaseFamily extends Family<AsyncValue<OTPResponse>> {
  /// See also [verifyOtpUseCase].
  const VerifyOtpUseCaseFamily();

  /// See also [verifyOtpUseCase].
  VerifyOtpUseCaseProvider call({
    required String otp,
    required String email,
  }) {
    return VerifyOtpUseCaseProvider(
      otp: otp,
      email: email,
    );
  }

  @override
  VerifyOtpUseCaseProvider getProviderOverride(
    covariant VerifyOtpUseCaseProvider provider,
  ) {
    return call(
      otp: provider.otp,
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
  String? get name => r'verifyOtpUseCaseProvider';
}

/// See also [verifyOtpUseCase].
class VerifyOtpUseCaseProvider extends AutoDisposeFutureProvider<OTPResponse> {
  /// See also [verifyOtpUseCase].
  VerifyOtpUseCaseProvider({
    required String otp,
    required String email,
  }) : this._internal(
          (ref) => verifyOtpUseCase(
            ref as VerifyOtpUseCaseRef,
            otp: otp,
            email: email,
          ),
          from: verifyOtpUseCaseProvider,
          name: r'verifyOtpUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOtpUseCaseHash,
          dependencies: VerifyOtpUseCaseFamily._dependencies,
          allTransitiveDependencies:
              VerifyOtpUseCaseFamily._allTransitiveDependencies,
          otp: otp,
          email: email,
        );

  VerifyOtpUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.otp,
    required this.email,
  }) : super.internal();

  final String otp;
  final String email;

  @override
  Override overrideWith(
    FutureOr<OTPResponse> Function(VerifyOtpUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOtpUseCaseProvider._internal(
        (ref) => create(ref as VerifyOtpUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        otp: otp,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OTPResponse> createElement() {
    return _VerifyOtpUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOtpUseCaseProvider &&
        other.otp == otp &&
        other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyOtpUseCaseRef on AutoDisposeFutureProviderRef<OTPResponse> {
  /// The parameter `otp` of this provider.
  String get otp;

  /// The parameter `email` of this provider.
  String get email;
}

class _VerifyOtpUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<OTPResponse>
    with VerifyOtpUseCaseRef {
  _VerifyOtpUseCaseProviderElement(super.provider);

  @override
  String get otp => (origin as VerifyOtpUseCaseProvider).otp;
  @override
  String get email => (origin as VerifyOtpUseCaseProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
