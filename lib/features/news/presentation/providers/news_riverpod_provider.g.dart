// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_riverpod_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsHash() => r'90036ce37e9b863234d425c74b0e91ad83b32c26';

/// See also [news].
@ProviderFor(news)
final newsProvider =
    AutoDisposeFutureProvider<DataState<BreakingNewsResponse>>.internal(
  news,
  name: r'newsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRef = AutoDisposeFutureProviderRef<DataState<BreakingNewsResponse>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
