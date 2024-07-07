import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/pages/login_page.dart';
import 'package:q_learn/features/auth/presentation/pages/register_page.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/features/news/presentation/pages/details_page.dart';
import 'package:q_learn/features/news/presentation/pages/profile_page.dart';
import 'package:q_learn/features/news/presentation/pages/root_page.dart';
import 'package:q_learn/features/news/presentation/pages/news_page.dart';
import 'package:q_learn/features/quiz_participation/presentation/pages/client_home_page.dart';
import 'package:q_learn/features/quiz_participation/presentation/pages/quiz_list_page.dart';
import 'package:q_learn/features/quiz_participation/presentation/pages/quizz_page.dart';
import 'package:q_learn/features/quiz_participation/presentation/pages/result_page.dart';

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
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
          children: [
            // Client home route
            CustomRoute(
              page: ClientHomeRoute.page,
              customRouteBuilder: (context, child, page) {
                return CupertinoPageRoute(
                  settings: page,
                  builder: (context) => child,
                );
              },
            ),

            // Profile page
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
          page: QuizListRoute.page,
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
        ),

        CustomRoute(
          page: QuizzRoute.page,
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
        ),

        CustomRoute(
          page: ResultRoute.page,
          customRouteBuilder: (context, child, page) {
            return CupertinoPageRoute(
              settings: page,
              builder: (context) => child,
            );
          },
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