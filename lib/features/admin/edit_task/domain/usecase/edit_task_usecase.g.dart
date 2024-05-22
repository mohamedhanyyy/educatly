// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editTaskUseCaseHash() => r'928902e43e11f424f430c969f2c690aaec14ec72';

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

/// See also [editTaskUseCase].
@ProviderFor(editTaskUseCase)
const editTaskUseCaseProvider = EditTaskUseCaseFamily();

/// See also [editTaskUseCase].
class EditTaskUseCaseFamily extends Family<AsyncValue<EditTaskModel>> {
  /// See also [editTaskUseCase].
  const EditTaskUseCaseFamily();

  /// See also [editTaskUseCase].
  EditTaskUseCaseProvider call({
    required String title,
    required String description,
    required DateTime startDate,
    required int taskId,
    required int statusId,
    required DateTime endDate,
    required int selectedPriority,
    required ManagerModel? selectedAssignee,
    required List<SubTasks> subTasks,
    List<File>? files,
  }) {
    return EditTaskUseCaseProvider(
      title: title,
      description: description,
      startDate: startDate,
      taskId: taskId,
      statusId: statusId,
      endDate: endDate,
      selectedPriority: selectedPriority,
      selectedAssignee: selectedAssignee,
      subTasks: subTasks,
      files: files,
    );
  }

  @override
  EditTaskUseCaseProvider getProviderOverride(
    covariant EditTaskUseCaseProvider provider,
  ) {
    return call(
      title: provider.title,
      description: provider.description,
      startDate: provider.startDate,
      taskId: provider.taskId,
      statusId: provider.statusId,
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
  String? get name => r'editTaskUseCaseProvider';
}

/// See also [editTaskUseCase].
class EditTaskUseCaseProvider extends AutoDisposeFutureProvider<EditTaskModel> {
  /// See also [editTaskUseCase].
  EditTaskUseCaseProvider({
    required String title,
    required String description,
    required DateTime startDate,
    required int taskId,
    required int statusId,
    required DateTime endDate,
    required int selectedPriority,
    required ManagerModel? selectedAssignee,
    required List<SubTasks> subTasks,
    List<File>? files,
  }) : this._internal(
          (ref) => editTaskUseCase(
            ref as EditTaskUseCaseRef,
            title: title,
            description: description,
            startDate: startDate,
            taskId: taskId,
            statusId: statusId,
            endDate: endDate,
            selectedPriority: selectedPriority,
            selectedAssignee: selectedAssignee,
            subTasks: subTasks,
            files: files,
          ),
          from: editTaskUseCaseProvider,
          name: r'editTaskUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editTaskUseCaseHash,
          dependencies: EditTaskUseCaseFamily._dependencies,
          allTransitiveDependencies:
              EditTaskUseCaseFamily._allTransitiveDependencies,
          title: title,
          description: description,
          startDate: startDate,
          taskId: taskId,
          statusId: statusId,
          endDate: endDate,
          selectedPriority: selectedPriority,
          selectedAssignee: selectedAssignee,
          subTasks: subTasks,
          files: files,
        );

  EditTaskUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.description,
    required this.startDate,
    required this.taskId,
    required this.statusId,
    required this.endDate,
    required this.selectedPriority,
    required this.selectedAssignee,
    required this.subTasks,
    required this.files,
  }) : super.internal();

  final String title;
  final String description;
  final DateTime startDate;
  final int taskId;
  final int statusId;
  final DateTime endDate;
  final int selectedPriority;
  final ManagerModel? selectedAssignee;
  final List<SubTasks> subTasks;
  final List<File>? files;

  @override
  Override overrideWith(
    FutureOr<EditTaskModel> Function(EditTaskUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditTaskUseCaseProvider._internal(
        (ref) => create(ref as EditTaskUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        description: description,
        startDate: startDate,
        taskId: taskId,
        statusId: statusId,
        endDate: endDate,
        selectedPriority: selectedPriority,
        selectedAssignee: selectedAssignee,
        subTasks: subTasks,
        files: files,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EditTaskModel> createElement() {
    return _EditTaskUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditTaskUseCaseProvider &&
        other.title == title &&
        other.description == description &&
        other.startDate == startDate &&
        other.taskId == taskId &&
        other.statusId == statusId &&
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
    hash = _SystemHash.combine(hash, taskId.hashCode);
    hash = _SystemHash.combine(hash, statusId.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, selectedPriority.hashCode);
    hash = _SystemHash.combine(hash, selectedAssignee.hashCode);
    hash = _SystemHash.combine(hash, subTasks.hashCode);
    hash = _SystemHash.combine(hash, files.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditTaskUseCaseRef on AutoDisposeFutureProviderRef<EditTaskModel> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `startDate` of this provider.
  DateTime get startDate;

  /// The parameter `taskId` of this provider.
  int get taskId;

  /// The parameter `statusId` of this provider.
  int get statusId;

  /// The parameter `endDate` of this provider.
  DateTime get endDate;

  /// The parameter `selectedPriority` of this provider.
  int get selectedPriority;

  /// The parameter `selectedAssignee` of this provider.
  ManagerModel? get selectedAssignee;

  /// The parameter `subTasks` of this provider.
  List<SubTasks> get subTasks;

  /// The parameter `files` of this provider.
  List<File>? get files;
}

class _EditTaskUseCaseProviderElement
    extends AutoDisposeFutureProviderElement<EditTaskModel>
    with EditTaskUseCaseRef {
  _EditTaskUseCaseProviderElement(super.provider);

  @override
  String get title => (origin as EditTaskUseCaseProvider).title;
  @override
  String get description => (origin as EditTaskUseCaseProvider).description;
  @override
  DateTime get startDate => (origin as EditTaskUseCaseProvider).startDate;
  @override
  int get taskId => (origin as EditTaskUseCaseProvider).taskId;
  @override
  int get statusId => (origin as EditTaskUseCaseProvider).statusId;
  @override
  DateTime get endDate => (origin as EditTaskUseCaseProvider).endDate;
  @override
  int get selectedPriority =>
      (origin as EditTaskUseCaseProvider).selectedPriority;
  @override
  ManagerModel? get selectedAssignee =>
      (origin as EditTaskUseCaseProvider).selectedAssignee;
  @override
  List<SubTasks> get subTasks => (origin as EditTaskUseCaseProvider).subTasks;
  @override
  List<File>? get files => (origin as EditTaskUseCaseProvider).files;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
