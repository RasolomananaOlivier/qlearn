import 'package:q_learn/features/auth/domain/models/token.dart';
import 'package:q_learn/features/auth/domain/models/user.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

class AuthState {
  final User? user;
  final Token? token;

  AuthState({this.user, this.token});
}

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  final authRepository = locator.get<AuthRepository>();

  @override
  Future<AuthState> build() async {
    final token = await authRepository.getToken();
    final user = await authRepository.getUser();

    return AuthState(
      token: token,
      user: user,
    );
  }

  void setAuth(AuthState authState) async {
    state = AsyncValue.data(authState);
  }

  bool isAuthenticated() {
    return state.value?.user != null;
  }
}
