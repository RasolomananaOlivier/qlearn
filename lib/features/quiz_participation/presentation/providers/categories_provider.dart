import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: true)
class FilterCategories extends _$FilterCategories {
  @override
  List<int> build() {
    return [];
  }

  void setCategories(List<int> categories) {
    state = categories;
  }
}
