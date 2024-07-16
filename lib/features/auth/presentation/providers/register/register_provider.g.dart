// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerHash() => r'31c3da8db63eb55696c72213d5d711ed37715517';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [register].
@ProviderFor(register)
const registerProvider = RegisterFamily();

/// See also [register].
class RegisterFamily extends Family<AsyncValue<void>> {
  /// See also [register].
  const RegisterFamily();

  /// See also [register].
  RegisterProvider call(
    RegisterRequest request,
  ) {
    return RegisterProvider(
      request,
    );
  }

  @override
  RegisterProvider getProviderOverride(
    covariant RegisterProvider provider,
  ) {
    return call(
      provider.request,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'registerProvider';
}

/// See also [register].
class RegisterProvider extends AutoDisposeFutureProvider<void> {
  /// See also [register].
  RegisterProvider(
    RegisterRequest request,
  ) : this._internal(
          (ref) => register(
            ref as RegisterRef,
            request,
          ),
          from: registerProvider,
          name: r'registerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerHash,
          dependencies: RegisterFamily._dependencies,
          allTransitiveDependencies: RegisterFamily._allTransitiveDependencies,
          request: request,
        );

  RegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final RegisterRequest request;

  @override
  Override overrideWith(
    FutureOr<void> Function(RegisterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterProvider._internal(
        (ref) => create(ref as RegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `request` of this provider.
  RegisterRequest get request;
}

class _RegisterProviderElement extends AutoDisposeFutureProviderElement<void>
    with RegisterRef {
  _RegisterProviderElement(super.provider);

  @override
  RegisterRequest get request => (origin as RegisterProvider).request;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
