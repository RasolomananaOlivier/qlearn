import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/pages/LoginPage.dart';
import 'package:q_learn/features/auth/presentation/pages/RegisterPage.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/features/news/presentation/pages/details_page.dart';
import 'package:q_learn/features/news/presentation/pages/profile_page.dart';
import 'package:q_learn/features/news/presentation/pages/root_page.dart';
import 'package:q_learn/features/news/presentation/pages/news_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  WidgetRef ref;

  AppRouter(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = ref.watch(authProvider).isAuthenticated;

    if (isAuthenticated ||
        resolver.route.name == LoginRoute.name ||
        resolver.route.name == RegisterRoute.name) {
      // we continue navigation
      resolver.next();
    } else {
      // else we navigate to the Login page so we get authenticateed

      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(
        const LoginRoute(),
      );
    }
  }

  @override
  List<AutoRoute> get routes => [
        // Login route
        CustomRoute(
          page: LoginRoute.page,
          keepHistory: true,
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
        ),

        // Register route
        CustomRoute(
          page: RegisterRoute.page,
          keepHistory: false,
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
        ),

        // routes go here
        CustomRoute(
          page: RootRoute.page,
          initial: true,

          // guards: [AuthGuard()],
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
          children: [
            CustomRoute(
              page: NewsRoute.page,
              customRouteBuilder: (context, child, page) {
                return CupertinoPageRoute(
                  settings: page,
                  builder: (context) => child,
                );
              },
            ),
            CustomRoute(
              page: ProfileRoute.page,
              customRouteBuilder: (context, child, page) {
                return CupertinoPageRoute(
                  settings: page,
                  builder: (context) => child,
                );
              },
            ),
          ],
        ),
        CustomRoute(
          page: DetailsRoute.page,
          // guards: [AuthGuard()],
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
        )
      ];
}
