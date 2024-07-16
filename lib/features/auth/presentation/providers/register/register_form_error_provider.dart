import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_form_error_provider.g.dart';

@JsonSerializable()
class FormError {
  final String? email;

  FormError(this.email);

  factory FormError.fromJson(Map<String, dynamic> json) =>
      _$FormErrorFromJson(json);

  Map<String, dynamic> toJson() => _$FormErrorToJson(this);
}

@riverpod
class RegisterFormError extends _$RegisterFormError {
  @override
  FormError build() {
    return FormError(null);
  }

  void setEmailError(String? email) {
    state = FormError(email);
  }
}
