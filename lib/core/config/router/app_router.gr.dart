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
    AdminHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminHomePage(),
      );
    },
    ClientHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientHomePage(),
      );
    },
    CreationCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CreationCategoryRouteArgs>(
          orElse: () => const CreationCategoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreationCategoryPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    CreationQuestionRoute.name: (routeData) {
      final args = routeData.argsAs<CreationQuestionRouteArgs>(
          orElse: () => const CreationQuestionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreationQuestionPage(
          key: args.key,
          question: args.question,
        ),
      );
    },
    CreationQuizRoute.name: (routeData) {
      final args = routeData.argsAs<CreationQuizRouteArgs>(
          orElse: () => const CreationQuizRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreationQuizPage(
          key: args.key,
          quiz: args.quiz,
        ),
      );
    },
    DetailQuestionRoute.name: (routeData) {
      final args = routeData.argsAs<DetailQuestionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailQuestionPage(
          key: args.key,
          question: args.question,
        ),
      );
    },
    ListCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListCategoryPage(),
      );
    },
    ListQuestionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListQuestionPage(),
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
/// [AdminHomePage]
class AdminHomeRoute extends PageRouteInfo<void> {
  const AdminHomeRoute({List<PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

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
/// [CreationCategoryPage]
class CreationCategoryRoute extends PageRouteInfo<CreationCategoryRouteArgs> {
  CreationCategoryRoute({
    Key? key,
    Map<String, dynamic>? category,
    List<PageRouteInfo>? children,
  }) : super(
          CreationCategoryRoute.name,
          args: CreationCategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CreationCategoryRoute';

  static const PageInfo<CreationCategoryRouteArgs> page =
      PageInfo<CreationCategoryRouteArgs>(name);
}

class CreationCategoryRouteArgs {
  const CreationCategoryRouteArgs({
    this.key,
    this.category,
  });

  final Key? key;

  final Map<String, dynamic>? category;

  @override
  String toString() {
    return 'CreationCategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [CreationQuestionPage]
class CreationQuestionRoute extends PageRouteInfo<CreationQuestionRouteArgs> {
  CreationQuestionRoute({
    Key? key,
    Question? question,
    List<PageRouteInfo>? children,
  }) : super(
          CreationQuestionRoute.name,
          args: CreationQuestionRouteArgs(
            key: key,
            question: question,
          ),
          initialChildren: children,
        );

  static const String name = 'CreationQuestionRoute';

  static const PageInfo<CreationQuestionRouteArgs> page =
      PageInfo<CreationQuestionRouteArgs>(name);
}

class CreationQuestionRouteArgs {
  const CreationQuestionRouteArgs({
    this.key,
    this.question,
  });

  final Key? key;

  final Question? question;

  @override
  String toString() {
    return 'CreationQuestionRouteArgs{key: $key, question: $question}';
  }
}

/// generated route for
/// [CreationQuizPage]
class CreationQuizRoute extends PageRouteInfo<CreationQuizRouteArgs> {
  CreationQuizRoute({
    Key? key,
    Quizz? quiz,
    List<PageRouteInfo>? children,
  }) : super(
          CreationQuizRoute.name,
          args: CreationQuizRouteArgs(
            key: key,
            quiz: quiz,
          ),
          initialChildren: children,
        );

  static const String name = 'CreationQuizRoute';

  static const PageInfo<CreationQuizRouteArgs> page =
      PageInfo<CreationQuizRouteArgs>(name);
}

class CreationQuizRouteArgs {
  const CreationQuizRouteArgs({
    this.key,
    this.quiz,
  });

  final Key? key;

  final Quizz? quiz;

  @override
  String toString() {
    return 'CreationQuizRouteArgs{key: $key, quiz: $quiz}';
  }
}

/// generated route for
/// [DetailQuestionPage]
class DetailQuestionRoute extends PageRouteInfo<DetailQuestionRouteArgs> {
  DetailQuestionRoute({
    Key? key,
    required Question question,
    List<PageRouteInfo>? children,
  }) : super(
          DetailQuestionRoute.name,
          args: DetailQuestionRouteArgs(
            key: key,
            question: question,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailQuestionRoute';

  static const PageInfo<DetailQuestionRouteArgs> page =
      PageInfo<DetailQuestionRouteArgs>(name);
}

class DetailQuestionRouteArgs {
  const DetailQuestionRouteArgs({
    this.key,
    required this.question,
  });

  final Key? key;

  final Question question;

  @override
  String toString() {
    return 'DetailQuestionRouteArgs{key: $key, question: $question}';
  }
}

/// generated route for
/// [ListCategoryPage]
class ListCategoryRoute extends PageRouteInfo<void> {
  const ListCategoryRoute({List<PageRouteInfo>? children})
      : super(
          ListCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListQuestionPage]
class ListQuestionRoute extends PageRouteInfo<void> {
  const ListQuestionRoute({List<PageRouteInfo>? children})
      : super(
          ListQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListQuestionRoute';

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
