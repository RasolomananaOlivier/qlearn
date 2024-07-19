// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_questions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getQuestionsHash() => r'756b38432afb850133d513db3a9fb36b60cec398';

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

/// See also [getQuestions].
@ProviderFor(getQuestions)
const getQuestionsProvider = GetQuestionsFamily();

/// See also [getQuestions].
class GetQuestionsFamily
    extends Family<AsyncValue<DataState<QuestionsResponse>>> {
  /// See also [getQuestions].
  const GetQuestionsFamily();

  /// See also [getQuestions].
  GetQuestionsProvider call(
    int quizId,
  ) {
    return GetQuestionsProvider(
      quizId,
    );
  }

  @override
  GetQuestionsProvider getProviderOverride(
    covariant GetQuestionsProvider provider,
  ) {
    return call(
      provider.quizId,
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
  String? get name => r'getQuestionsProvider';
}

/// See also [getQuestions].
class GetQuestionsProvider
    extends AutoDisposeFutureProvider<DataState<QuestionsResponse>> {
  /// See also [getQuestions].
  GetQuestionsProvider(
    int quizId,
  ) : this._internal(
          (ref) => getQuestions(
            ref as GetQuestionsRef,
            quizId,
          ),
          from: getQuestionsProvider,
          name: r'getQuestionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuestionsHash,
          dependencies: GetQuestionsFamily._dependencies,
          allTransitiveDependencies:
              GetQuestionsFamily._allTransitiveDependencies,
          quizId: quizId,
        );

  GetQuestionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizId,
  }) : super.internal();

  final int quizId;

  @override
  Override overrideWith(
    FutureOr<DataState<QuestionsResponse>> Function(GetQuestionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetQuestionsProvider._internal(
        (ref) => create(ref as GetQuestionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizId: quizId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DataState<QuestionsResponse>>
      createElement() {
    return _GetQuestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuestionsProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetQuestionsRef
    on AutoDisposeFutureProviderRef<DataState<QuestionsResponse>> {
  /// The parameter `quizId` of this provider.
  int get quizId;
}

class _GetQuestionsProviderElement
    extends AutoDisposeFutureProviderElement<DataState<QuestionsResponse>>
    with GetQuestionsRef {
  _GetQuestionsProviderElement(super.provider);

  @override
  int get quizId => (origin as GetQuestionsProvider).quizId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
