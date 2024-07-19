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
    ClientHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientHomePage(),
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
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultPage(
          key: args.key,
          quizz: args.quizz,
        ),
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
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required Quiz quizz,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            quizz: quizz,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.quizz,
  });

  final Key? key;

  final Quiz quizz;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, quizz: $quizz}';
  }
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
