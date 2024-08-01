import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizzes_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/search_keyword_provider.dart';

class QuizSearchBar extends ConsumerStatefulWidget {
  const QuizSearchBar({
    super.key,
    required this.parentScaffoldKey,
  });

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  @override
  QuizSearchBarState createState() => QuizSearchBarState();
}

class QuizSearchBarState extends ConsumerState<QuizSearchBar> {
  final controller = TextEditingController();

  void handleSubmit(String keyword) {
    ref
        .read(searchKeywordProvider.notifier)
        .setKeyword(keyword.isEmpty ? null : keyword);

    ref.read(quizzesProvider.notifier).invalidate();
  }

  void handleClear() {
    controller.clear();

    ref.read(searchKeywordProvider.notifier).setKeyword(null);

    ref.read(quizzesProvider.notifier).invalidate();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: controller,
              onSubmitted: handleSubmit,
              cursorColor: const Color.fromRGBO(0, 0, 0, 0.6),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 25.0),
                hintText: 'Exemple: JavaScript, PHP ...',
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 56),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(120.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(120.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.black12.withAlpha(20),
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    if (ref.read(searchKeywordProvider) == null) {
                      final text = controller.text;
                      if (text.isEmpty) return;

                      handleSubmit(controller.text);
                    } else {
                      handleClear();
                    }
                  },
                  icon: ref.watch(searchKeywordProvider) == null
                      ? const Icon(
                          Icons.search,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        )
                      : const Icon(
                          Icons.close,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                ),
              ),
            ),
          ),
        ),

        // Filter button
        IconButton(
          onPressed: () {
            widget.parentScaffoldKey.currentState!.openEndDrawer();
          },
          icon: const Icon(Icons.tune),
        )
      ],
    );
  }
}
