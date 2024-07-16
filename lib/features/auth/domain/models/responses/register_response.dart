import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/features/auth/domain/models/token.dart';
import 'package:q_learn/features/auth/domain/models/user.dart';

part 'register_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponse {
  final User user;
  final Token accessToken;

  RegisterResponse({required this.user, required this.accessToken});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  String toString() {
    return "user: $user, token $accessToken";
  }
}
