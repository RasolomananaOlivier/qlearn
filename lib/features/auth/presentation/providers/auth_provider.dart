import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/domain/models/token.dart';
import 'package:q_learn/features/auth/domain/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

class AuthState {
  final User? user;
  final Token? token;

  AuthState({this.user, this.token});
}

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthState();
  }

  void setAuth(AuthState authState) async {
    state = authState;
  }

  bool isAuthenticated() {
    return state.user != null;
  }
}
