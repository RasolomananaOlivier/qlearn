import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_error_provider.g.dart';

@JsonSerializable()
class FormError {
  final String? email;
  final String? password;

  FormError({this.email, this.password});

  factory FormError.fromJson(Map<String, dynamic> json) =>
      _$FormErrorFromJson(json);

  Map<String, dynamic> toJson() => _$FormErrorToJson(this);
}

@riverpod
class LoginFormError extends _$LoginFormError {
  @override
  FormError build() {
    return FormError();
  }

  void setIncorrectCredentials() {
    state = FormError(email: "Email ou mot de passe incorrecte", password: "");
  }

  void setEmailError(String? error) {
    state = FormError(email: error);
  }

  void setPasswordError(String? error) {
    state = FormError(password: error);
  }

  void reset() {
    state = FormError();
  }
}
