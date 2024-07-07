import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:q_learn/core/utils/constants/input_decoration_property.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _hidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First name input
          const Text(
            'Nom',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'firstName',
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Entrer votre nom',
              // isDense: true,
              hintStyle: InputDecorationProperty.hintStyle(),
              border: InputDecorationProperty.border(context),
              enabledBorder: InputDecorationProperty.enabledBorder(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(height: 20),

          // First name input
          const Text(
            'Prénom(s)',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'lastName',
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Entrer votre prénom',
              // isDense: true,
              hintStyle: InputDecorationProperty.hintStyle(),
              border: InputDecorationProperty.border(context),
              enabledBorder: InputDecorationProperty.enabledBorder(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          const SizedBox(height: 20),

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
            decoration: InputDecoration(
              hintText: 'Entrer votre email',
              // isDense: true,
              hintStyle: InputDecorationProperty.hintStyle(),
              border: InputDecorationProperty.border(context),
              enabledBorder: InputDecorationProperty.enabledBorder(),
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
            ),
            obscureText: _hidePassword,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(8),
            ]),
          ),
          const SizedBox(height: 20),

          // Submit button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
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
          ),
        ],
      ),
    );
  }
}
