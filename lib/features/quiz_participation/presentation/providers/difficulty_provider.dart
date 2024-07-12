import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'difficulty_provider.g.dart';

@Riverpod(keepAlive: true)
class Difficulty extends _$Difficulty {
  @override
  int build() {
    return 1;
  }

  void setDifficulty(int difficulty) {
    state = difficulty;
  }

  bool isSelected(int difficulty) {
    return state == difficulty;
  }
}
