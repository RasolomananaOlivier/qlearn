import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_keyword_provider.g.dart';

@riverpod
class SearchKeyword extends _$SearchKeyword {
  @override
  String? build() {
    return null;
  }

  void setKeyword(String? keyword) {
    state = keyword;
  }
}
