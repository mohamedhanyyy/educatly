// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTaskUseCaseHash() => r'6b0294659917170edf1ef0d66c06a3cde4d6db71';

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

/// See also [addTaskUseCase].
@ProviderFor(addTaskUseCase)
const addTaskUseCaseProvider = AddTaskUseCaseFamily();

/// See also [addTaskUseCase].
class AddTaskUseCaseFamily extends Family<AsyncValue<AddTaskResponse>> {
  /// See also [addTaskUseCase].
  const AddTaskUseCaseFamily();

  /// See also [addTaskUseCase].
  AddTaskUseCaseProvider call({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String? selectedPriority,
    required ManagerModel? selectedAssignee,
    required List<String> subTasks,
    List<File>? files,
  }) {
    return AddTaskUseCaseProvider(
      title: title,
      description: description,
      startDate: startDate,
      endDate: endDate,
      selectedPriority: selectedPriority,
      selectedAssignee: selectedAssignee,
      subTasks: subTasks,
      files: files,
    );
  }

  @override
  AddTaskUseCaseProvider getProviderOverride(
    covariant AddTaskUseCaseProvider provider,
  ) {
    return call(
      title: provider.title,
      description: provider.description,
      startDate: provider.startDate,
      endDate: provider.endDate,
      selectedPriority: provider.selectedPriority,
      selectedAssignee: provider.selectedAssignee,
      subTasks: provider.subTasks,
      files: provider.files,
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
  String? get name => r'addTaskUseCaseProvider';
}

/// See also [addTaskUseCase].
class AddTaskUseCaseProvider
    extends AutoDisposeFutureProvider<AddTaskResponse> {
  /// See also [addTaskUseCase].
  AddTaskUseCaseProvider({
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String? selectedPriority,
    required ManagerModel? selectedAssignee,
    required List<String> subTasks,
    List<File>? files,
  }) : this._internal(
          (ref) => addTaskUseCase(
            ref as AddTaskUseCaseRef,
            title: title,
            description: description,
            startDate: startDate,
            endDate: endDate,
            selectedPriority: selectedPriority,
            selectedAssignee: selectedAssignee,
            subTasks: subTasks,
            files: files,
          ),
          from: addTaskUseCaseProvider,
          name: r'addTaskUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addTaskUseCaseHash,
          dependencies: AddTaskUseCaseFamily._dependencies,
          allTransitiveDependencies:
              AddTaskUseCaseFamily._allTransitiveDependencies,
          title: title,
          description: description,
          startDate: startDate,
          endDate: endDate,
          selectedPriority: selectedPriority,
          selectedAssignee: selectedAssignee,
          subTasks: subTasks,
          files: files,
        );

  AddTaskUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.selectedPriority,
    required this.selectedAssignee,
    required this.subTasks,
    required this.files,
  }) : super.internal();

  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String? selectedPriority;
  final ManagerModel? selectedAssignee;
  final List<String> subTasks;
  final List<File>? files;

  @override
  Override overrideWith(
    FutureOr<AddTaskResponse> Function(AddTaskUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddTaskUseCaseProvider._internal(
        (ref) => create(ref as AddTaskUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        description: description,
        startDate: startDate,
        endDate: endDate,
        selectedPriority: selectedPriority,
        selectedAssignee: selectedAssignee,
        subTasks: subTasks,
        files: files,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AddTaskResponse> createElement() {
    return _AddTaskUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddTaskUseCaseProvider &&
        other.title == title &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.selectedPriority == selectedPriority &&
        other.selectedAssignee == selectedAssignee &&
        other.subTasks == subTasks &&
        other.files == files;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, selectedPriority.hashCode);
    hash = _SystemHash.combine(hash, selectedAssignee.hashCode);
    hash = _SystemHash.combine(hash, subTasks.hashCode);
    hash = _SystemHash.combine(hash, files.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddTaskUseCaseRef on AutoDisposeFutureProviderRef<AddTaskResponse> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `startDate` of this provider.
  DateTime get startDate;

  /// The parameter `endDate` of this provider.
  DateTime get endDate;

  /// The parameter `selectedPriority` of this provider.
  String? get selectedPriority;

  /// The parameter `selectedAssignee` of this provider.
  ManagerModel? get selectedAssignee;

  /// The parameter `subTasks` of this provider.
  List<String> get subTasks;

  /// The parameter `files` of this provider.
  List<File>? get files;
}

class _AddTaskUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<AddTaskResponse>
    with AddTaskUseCaseRef {
  _AddTaskUseCaseProviderElement(super.provider);

  @override
  String get title => (origin as AddTaskUseCaseProvider).title;
  @override
  String get description => (origin as AddTaskUseCaseProvider).description;
  @override
  DateTime get startDate => (origin as AddTaskUseCaseProvider).startDate;
  @override
  DateTime get endDate => (origin as AddTaskUseCaseProvider).endDate;
  @override
  String? get selectedPriority =>
      (origin as AddTaskUseCaseProvider).selectedPriority;
  @override
  ManagerModel? get selectedAssignee =>
      (origin as AddTaskUseCaseProvider).selectedAssignee;
  @override
  List<String> get subTasks => (origin as AddTaskUseCaseProvider).subTasks;
  @override
  List<File>? get files => (origin as AddTaskUseCaseProvider).files;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
