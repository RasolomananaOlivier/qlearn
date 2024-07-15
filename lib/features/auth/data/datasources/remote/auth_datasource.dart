import 'package:dio/dio.dart';
import 'package:q_learn/features/auth/domain/models/requests/login_request.dart';
import 'package:q_learn/features/auth/domain/models/requests/register_request.dart';
import 'package:q_learn/features/auth/domain/models/responses/login_response.dart';
import 'package:q_learn/features/auth/domain/models/responses/register_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_datasource.g.dart';

@RestApi(baseUrl: 'http://localhost:3000/api/')
abstract class AuthDatasource {
  factory AuthDatasource(Dio dio, {String baseUrl}) = _AuthDatasource;

  @POST('/auth/login')
  Future<HttpResponse<LoginResponse>> login(@Body() LoginRequest body);

  @POST('/auth/register')
  Future<HttpResponse<RegisterResponse>> register(@Body() RegisterRequest body);
}
