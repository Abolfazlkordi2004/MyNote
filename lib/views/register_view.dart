import 'package:abolfazlnotes/services/auth/auth_exceptions.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_bloc.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_event.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_state.dart';
import 'package:abolfazlnotes/utilities.dart/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerview extends StatefulWidget {
  const Registerview({super.key});

  @override
  State<Registerview> createState() => _RegisterviewState();
}

class _RegisterviewState extends State<Registerview> {
  late final TextEditingController _password;
  late final TextEditingController _email;

  @override
  void initState() {
    _password = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateRegistering) {
          if (state.exception is WeakPasswordAuthException) {
            showErrorDialog(context, 'Weak password');
          } else if (state.exception is InvalidEmailAuthException) {
            showErrorDialog(context, 'This is an invalid email address');
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            showErrorDialog(context, 'Email is already in use');
          } else if (state.exception is GenericAuthException) {
            showErrorDialog(context, 'Failed to register');
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Enter your email'),
              ),
              TextField(
                controller: _password,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                decoration:
                    const InputDecoration(hintText: 'Enter your password'),
              ),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;

                        context
                            .read<AuthBloc>()
                            .add(AuthEventRegister(email, password));
                      },
                      child: const Text('Register'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthEventLogOut());
                      },
                      child: const Text('Already registered? Login here'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
