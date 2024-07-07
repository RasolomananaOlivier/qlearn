import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/core/config/themes/app_themes.dart';
import 'package:oktoast/oktoast.dart';

class App extends ConsumerWidget {
  App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OKToast(
      child: MaterialApp.router(
        routerConfig: AppRouter(ref).config(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
      ),
    );
  }
}
