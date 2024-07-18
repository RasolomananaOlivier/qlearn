import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/auth/data/datasources/remote/auth_datasource.dart';
import 'package:q_learn/features/auth/domain/models/requests/login_request.dart';
import 'package:q_learn/features/auth/domain/models/requests/register_request.dart';
import 'package:q_learn/features/auth/domain/models/responses/login_response.dart';
import 'package:q_learn/features/auth/domain/models/responses/register_response.dart';
import 'package:q_learn/features/auth/domain/models/token.dart';
import 'package:q_learn/features/auth/domain/models/user.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<DataState<LoginResponse>> login({
    required LoginRequest request,
  }) {
    return getStateOf(
      request: () => _datasource.login(request),
    );
  }

  @override
  Future<DataState<RegisterResponse>> register({
    required RegisterRequest request,
  }) {
    return getStateOf(
      request: () => _datasource.register(request),
    );
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(Token.tokenKey);
    await prefs.remove(Token.expiresAtKey);
  }

  @override
  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(User.idKey);
    await prefs.remove(User.firstNameKey);
    await prefs.remove(User.lastNameKey);
    await prefs.remove(User.fullNameKey);
    await prefs.remove(User.emailKey);
    await prefs.remove(User.roleKey);
    await prefs.remove(User.createdAtKey);
    await prefs.remove(User.updatedAtKey);
  }

  @override
  Future<Token?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString(Token.tokenKey);
    final expiresAt = prefs.getString(Token.expiresAtKey);

    if (accessToken != null && expiresAt != null) {
      return Token(
        token: accessToken,
        expiresAt: DateTime.parse(expiresAt),
      );
    }

    return null;
  }

  @override
  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getInt(User.idKey);
    final firstName = prefs.getString(User.firstNameKey);
    final lastName = prefs.getString(User.lastNameKey);
    final fullName = prefs.getString(User.fullNameKey);
    final email = prefs.getString(User.emailKey);
    final role = prefs.getString(User.roleKey);
    final createdAt = prefs.getString(User.createdAtKey);
    final updatedAt = prefs.getString(User.updatedAtKey);

    if (id != null &&
        firstName != null &&
        lastName != null &&
        fullName != null &&
        role != null &&
        email != null &&
        createdAt != null &&
        updatedAt != null) {
      return User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        fullName: fullName,
        role: role,
        email: email,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
      );
    }

    return null;
  }

  @override
  Future<void> saveToken(Token token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(Token.tokenKey, token.token);
    await prefs.setString(Token.expiresAtKey, token.expiresAt.toString());
  }

  @override
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(User.idKey, user.id);
    await prefs.setString(User.firstNameKey, user.firstName);
    await prefs.setString(User.lastNameKey, user.lastName);
    await prefs.setString(User.fullNameKey, user.fullName);
    await prefs.setString(User.emailKey, user.email);
    await prefs.setString(User.roleKey, user.role);
    await prefs.setString(User.createdAtKey, user.createdAt.toString());
    await prefs.setString(User.updatedAtKey, user.updatedAt.toString());
  }
}
