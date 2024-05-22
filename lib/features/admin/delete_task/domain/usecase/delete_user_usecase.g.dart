// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteUserUseCaseHash() => r'7ca5e90d402d27952d6df2c2476f23c306824e7c';

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

/// See also [deleteUserUseCase].
@ProviderFor(deleteUserUseCase)
const deleteUserUseCaseProvider = DeleteUserUseCaseFamily();

/// See also [deleteUserUseCase].
class DeleteUserUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [deleteUserUseCase].
  const DeleteUserUseCaseFamily();

  /// See also [deleteUserUseCase].
  DeleteUserUseCaseProvider call({
    required String id,
  }) {
    return DeleteUserUseCaseProvider(
      id: id,
    );
  }

  @override
  DeleteUserUseCaseProvider getProviderOverride(
    covariant DeleteUserUseCaseProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'deleteUserUseCaseProvider';
}

/// See also [deleteUserUseCase].
class DeleteUserUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteUserUseCase].
  DeleteUserUseCaseProvider({
    required String id,
  }) : this._internal(
          (ref) => deleteUserUseCase(
            ref as DeleteUserUseCaseRef,
            id: id,
          ),
          from: deleteUserUseCaseProvider,
          name: r'deleteUserUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteUserUseCaseHash,
          dependencies: DeleteUserUseCaseFamily._dependencies,
          allTransitiveDependencies:
              DeleteUserUseCaseFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteUserUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteUserUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteUserUseCaseProvider._internal(
        (ref) => create(ref as DeleteUserUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteUserUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteUserUseCaseProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteUserUseCaseRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteUserUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteUserUseCaseRef {
  _DeleteUserUseCaseProviderElement(super.provider);

  @override
  String get id => (origin as DeleteUserUseCaseProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
