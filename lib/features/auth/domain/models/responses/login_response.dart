import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/features/auth/domain/models/token.dart';
import 'package:q_learn/features/auth/domain/models/user.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  final User user;
  final Token accessToken;

  LoginResponse({required this.user, required this.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
