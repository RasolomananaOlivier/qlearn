import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  final String token;
  final DateTime expiresAt;

  // For shared preferences key
  static const String tokenKey = 'token';
  static const String expiresAtKey = 'expiresAt';

  Token({
    required this.token,
    required this.expiresAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  @override
  String toString() {
    return "token: $token, expiresAt $expiresAt";
  }

  String getAuthorization() {
    return "Bearer $token";
  }
}
