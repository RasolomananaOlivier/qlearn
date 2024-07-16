import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/auth/domain/models/requests/register_request.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/features/auth/presentation/providers/register/register_form_error_provider.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Future<void> register(RegisterRef ref, RegisterRequest request) async {
  final repository = locator.get<AuthRepository>();

  final dataState = await repository.register(request: request);

  if (dataState is DataSuccess) {
    ref.read(authProvider.notifier).setAuth(
          AuthState(
            user: dataState.data?.user,
            token: dataState.data?.accessToken,
          ),
        );
  } else {
    final response = dataState.error?.response;
    if (response != null) {
      ref.read(registerFormErrorProvider.notifier).setEmailError(
            response.data['data']['email'],
          );
    }
  }
}
