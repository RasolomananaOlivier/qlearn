import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/core/utils/constants/input_decoration_property.dart';
import 'package:q_learn/features/auth/domain/models/requests/login_request.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/features/auth/presentation/providers/login/login_form_error_provider.dart';
import 'package:q_learn/features/auth/presentation/providers/login/login_provider.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _hidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  void handleLogin() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final request = LoginRequest.fromJson(_formKey.currentState!.value);

      await ref.read(loginProvider.notifier).login(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authProvider.notifier);

    if (authNotifier.isAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.replaceRoute(const ClientHomeRoute());
      });
    }

    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Email input
          const Text(
            'Email',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'email',
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            onChanged: (value) {
              ref.read(loginFormErrorProvider.notifier).reset();
            },
            decoration: InputDecoration(
              hintText: 'Entrer votre email',
              // isDense: true,
              hintStyle: InputDecorationProperty.hintStyle(),
              border: InputDecorationProperty.border(context),
              enabledBorder: InputDecorationProperty.enabledBorder(),
              errorText: ref.watch(loginFormErrorProvider).email,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 20),

          // Password input
          const Text(
            'Mot de passe',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'password',
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const [AutofillHints.password],
            onChanged: (value) {
              ref.read(loginFormErrorProvider.notifier).reset();
            },
            decoration: InputDecoration(
              hintText: 'Entrer votre mot de passe',
              hintStyle: InputDecorationProperty.hintStyle(),
              border: InputDecorationProperty.border(context),
              enabledBorder: InputDecorationProperty.enabledBorder(),
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                    _hidePassword ? Icons.visibility : Icons.visibility_off),
              ),
              errorText: ref.watch(loginFormErrorProvider).password,
            ),
            obscureText: _hidePassword,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(8),
            ]),
          ),
          const SizedBox(height: 25),

          // Submit button
          buildLoginButton(),
        ],
      ),
    );
  }

  Widget buildLoginButton() {
    final asyncValue = ref.watch(loginProvider);

    return ElevatedButton(
      onPressed: asyncValue.isLoading ? null : handleLogin,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent.shade400,
        minimumSize: const Size.fromHeight(44),
      ),
      child: Text(
        'Se connecter',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
