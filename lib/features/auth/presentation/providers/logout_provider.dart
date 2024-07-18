import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Future<void> logout(LogoutRef ref) async {
  final repository = locator.get<AuthRepository>();

  await repository.deleteToken();
  await repository.deleteUser();

  ref.read(authProvider.notifier).setAuth(
        AuthState(),
      );
}
