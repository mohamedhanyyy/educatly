// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_task_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteTaskUseCaseHash() => r'4bfa45ac60989a7998a08a56b8dbf6c8e5993610';

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

/// See also [deleteTaskUseCase].
@ProviderFor(deleteTaskUseCase)
const deleteTaskUseCaseProvider = DeleteTaskUseCaseFamily();

/// See also [deleteTaskUseCase].
class DeleteTaskUseCaseFamily extends Family<AsyncValue<void>> {
  /// See also [deleteTaskUseCase].
  const DeleteTaskUseCaseFamily();

  /// See also [deleteTaskUseCase].
  DeleteTaskUseCaseProvider call({
    required int id,
  }) {
    return DeleteTaskUseCaseProvider(
      id: id,
    );
  }

  @override
  DeleteTaskUseCaseProvider getProviderOverride(
    covariant DeleteTaskUseCaseProvider provider,
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
  String? get name => r'deleteTaskUseCaseProvider';
}

/// See also [deleteTaskUseCase].
class DeleteTaskUseCaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteTaskUseCase].
  DeleteTaskUseCaseProvider({
    required int id,
  }) : this._internal(
          (ref) => deleteTaskUseCase(
            ref as DeleteTaskUseCaseRef,
            id: id,
          ),
          from: deleteTaskUseCaseProvider,
          name: r'deleteTaskUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteTaskUseCaseHash,
          dependencies: DeleteTaskUseCaseFamily._dependencies,
          allTransitiveDependencies:
              DeleteTaskUseCaseFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteTaskUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteTaskUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteTaskUseCaseProvider._internal(
        (ref) => create(ref as DeleteTaskUseCaseRef),
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
    return _DeleteTaskUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteTaskUseCaseProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteTaskUseCaseRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteTaskUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteTaskUseCaseRef {
  _DeleteTaskUseCaseProviderElement(super.provider);

  @override
  int get id => (origin as DeleteTaskUseCaseProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
