import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'difficulty_provider.g.dart';

@Riverpod(keepAlive: true)
class Difficulty extends _$Difficulty {
  @override
  int build() {
    return 0;
  }

  void setDifficulty(int difficulty) {
    state = difficulty;
  }
}
