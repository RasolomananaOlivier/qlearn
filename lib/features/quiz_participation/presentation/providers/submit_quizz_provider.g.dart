// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quizz_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submitQuizzHash() => r'e847905560793e010db2b2812fee3b29f87327ea';

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

/// See also [submitQuizz].
@ProviderFor(submitQuizz)
const submitQuizzProvider = SubmitQuizzFamily();

/// See also [submitQuizz].
class SubmitQuizzFamily
    extends Family<AsyncValue<DataState<SubmitQuizzResponse>>> {
  /// See also [submitQuizz].
  const SubmitQuizzFamily();

  /// See also [submitQuizz].
  SubmitQuizzProvider call(
    int quizId,
  ) {
    return SubmitQuizzProvider(
      quizId,
    );
  }

  @override
  SubmitQuizzProvider getProviderOverride(
    covariant SubmitQuizzProvider provider,
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
  String? get name => r'submitQuizzProvider';
}

/// See also [submitQuizz].
class SubmitQuizzProvider
    extends AutoDisposeFutureProvider<DataState<SubmitQuizzResponse>> {
  /// See also [submitQuizz].
  SubmitQuizzProvider(
    int quizId,
  ) : this._internal(
          (ref) => submitQuizz(
            ref as SubmitQuizzRef,
            quizId,
          ),
          from: submitQuizzProvider,
          name: r'submitQuizzProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitQuizzHash,
          dependencies: SubmitQuizzFamily._dependencies,
          allTransitiveDependencies:
              SubmitQuizzFamily._allTransitiveDependencies,
          quizId: quizId,
        );

  SubmitQuizzProvider._internal(
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
    FutureOr<DataState<SubmitQuizzResponse>> Function(SubmitQuizzRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitQuizzProvider._internal(
        (ref) => create(ref as SubmitQuizzRef),
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
  AutoDisposeFutureProviderElement<DataState<SubmitQuizzResponse>>
      createElement() {
    return _SubmitQuizzProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitQuizzProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmitQuizzRef
    on AutoDisposeFutureProviderRef<DataState<SubmitQuizzResponse>> {
  /// The parameter `quizId` of this provider.
  int get quizId;
}

class _SubmitQuizzProviderElement
    extends AutoDisposeFutureProviderElement<DataState<SubmitQuizzResponse>>
    with SubmitQuizzRef {
  _SubmitQuizzProviderElement(super.provider);

  @override
  int get quizId => (origin as SubmitQuizzProvider).quizId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
