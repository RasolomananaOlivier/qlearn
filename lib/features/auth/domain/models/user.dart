import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String role;
  final DateTime deletedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
