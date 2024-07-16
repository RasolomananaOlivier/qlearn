// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_form_error_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormError _$FormErrorFromJson(Map<String, dynamic> json) => FormError(
      json['email'] as String?,
    );

Map<String, dynamic> _$FormErrorToJson(FormError instance) => <String, dynamic>{
      'email': instance.email,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerFormErrorHash() => r'f5907e80fd53b4ce0e48674f6568dd8fbfa6fae9';

/// See also [RegisterFormError].
@ProviderFor(RegisterFormError)
final registerFormErrorProvider =
    AutoDisposeNotifierProvider<RegisterFormError, FormError>.internal(
  RegisterFormError.new,
  name: r'registerFormErrorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerFormErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RegisterFormError = AutoDisposeNotifier<FormError>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
