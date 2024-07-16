// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_error_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormError _$FormErrorFromJson(Map<String, dynamic> json) => FormError(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$FormErrorToJson(FormError instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginFormErrorHash() => r'ecef5830f264634e23b6b18680a091471615e3f8';

/// See also [LoginFormError].
@ProviderFor(LoginFormError)
final loginFormErrorProvider =
    AutoDisposeNotifierProvider<LoginFormError, FormError>.internal(
  LoginFormError.new,
  name: r'loginFormErrorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginFormErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginFormError = AutoDisposeNotifier<FormError>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
