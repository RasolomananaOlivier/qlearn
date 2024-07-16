import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/auth/data/datasources/remote/auth_datasource.dart';
import 'package:q_learn/features/auth/domain/models/requests/login_request.dart';
import 'package:q_learn/features/auth/domain/models/requests/register_request.dart';
import 'package:q_learn/features/auth/domain/models/responses/login_response.dart';
import 'package:q_learn/features/auth/domain/models/responses/register_response.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';

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
}
