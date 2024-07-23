// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminDashboardPage(),
      );
    },
    ClientHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientHomePage(),
      );
    },
    CreationQuestionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreationQuestionPage(),
      );
    },
    CreationQuizzRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreationQuizzPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    QuizzRoute.name: (routeData) {
      final args = routeData.argsAs<QuizzRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizzPage(
          key: args.key,
          quizz: args.quizz,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    ResultRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResultPage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
      );
    },
  };
}

/// generated route for
/// [AdminDashboardPage]
class AdminDashboardRoute extends PageRouteInfo<void> {
  const AdminDashboardRoute({List<PageRouteInfo>? children})
      : super(
          AdminDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClientHomePage]
class ClientHomeRoute extends PageRouteInfo<void> {
  const ClientHomeRoute({List<PageRouteInfo>? children})
      : super(
          ClientHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreationQuestionPage]
class CreationQuestionRoute extends PageRouteInfo<void> {
  const CreationQuestionRoute({List<PageRouteInfo>? children})
      : super(
          CreationQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreationQuestionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreationQuizzPage]
class CreationQuizzRoute extends PageRouteInfo<void> {
  const CreationQuizzRoute({List<PageRouteInfo>? children})
      : super(
          CreationQuizzRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreationQuizzRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizzPage]
class QuizzRoute extends PageRouteInfo<QuizzRouteArgs> {
  QuizzRoute({
    Key? key,
    required Quiz quizz,
    List<PageRouteInfo>? children,
  }) : super(
          QuizzRoute.name,
          args: QuizzRouteArgs(
            key: key,
            quizz: quizz,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizzRoute';

  static const PageInfo<QuizzRouteArgs> page = PageInfo<QuizzRouteArgs>(name);
}

class QuizzRouteArgs {
  const QuizzRouteArgs({
    this.key,
    required this.quizz,
  });

  final Key? key;

  final Quiz quizz;

  @override
  String toString() {
    return 'QuizzRouteArgs{key: $key, quizz: $quizz}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultPage]
class ResultRoute extends PageRouteInfo<void> {
  const ResultRoute({List<PageRouteInfo>? children})
      : super(
          ResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
