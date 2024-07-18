import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/auth/domain/models/requests/login_request.dart';
import 'package:q_learn/features/auth/domain/models/requests/register_request.dart';
import 'package:q_learn/features/auth/domain/models/responses/login_response.dart';
import 'package:q_learn/features/auth/domain/models/responses/register_response.dart';
import 'package:q_learn/features/auth/domain/models/token.dart';
import 'package:q_learn/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  Future<DataState<LoginResponse>> login({
    required LoginRequest request,
  });

  Future<DataState<RegisterResponse>> register({
    required RegisterRequest request,
  });

  Future<void> saveToken(Token token);

  Future<Token?> getToken();

  Future<void> deleteToken();

  Future<void> saveUser(User user);

  Future<User?> getUser();

  Future<void> deleteUser();
}
