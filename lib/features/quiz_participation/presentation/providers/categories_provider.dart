import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@Riverpod(keepAlive: true)
class FilterCategories extends _$FilterCategories {
  @override
  List<int> build() {
    return [];
  }

  void toggleCategory(int category) {
    if (state.contains(category)) {
      state = state.where((c) => c != category).toList();
    } else {
      state = [...state, category];
    }
  }

  bool isSelected(int category) {
    return state.contains(category);
  }
}
