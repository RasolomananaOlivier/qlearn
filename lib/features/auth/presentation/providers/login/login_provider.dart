import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/auth/domain/models/requests/login_request.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/features/auth/presentation/providers/login/login_form_error_provider.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  Future<void> build() async {}

  Future<void> login(LoginRequest request) async {
    final repository = locator.get<AuthRepository>();

    state = const AsyncValue.loading();

    final dataState = await repository.login(request: request);

    if (dataState is DataSuccess) {
      final token = dataState.data?.accessToken;
      final user = dataState.data?.user;

      ref.read(authProvider.notifier).setAuth(
            AuthState(
              user: user,
              token: token,
            ),
          );

      // save user locally
      if (token != null && user != null) {
        await repository.saveToken(token);
        await repository.saveUser(user);
      }
    } else {
      final response = dataState.error?.response;

      if (response != null) {
        switch (response.statusCode) {
          case 401:
            ref.read(loginFormErrorProvider.notifier).setIncorrectCredentials();
            break;

          case 400:
            ref.read(loginFormErrorProvider.notifier)
              ..setEmailError(response.data['data']['email'])
              ..setPasswordError(response.data['data']['email']);

          default:
        }
      }
    }

    state = const AsyncValue<void>.data(null);
  }
}
