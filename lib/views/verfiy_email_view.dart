import 'package:abolfazlnotes/services/auth/auth-services.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_bloc.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerfiyEmailView extends StatefulWidget {
  const VerfiyEmailView({super.key});

  @override
  State<VerfiyEmailView> createState() => _VerfiyEmailViewState();
}

class _VerfiyEmailViewState extends State<VerfiyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "we ve' sent you an email verification.please open it to verify your account"),
          const Text(
              "If you haven't received a verification email yet, press the button below"),
          TextButton(
            onPressed: () {
              context
                  .read<AuthBloc>()
                  .add(const AuthEventSendEmailVerification());
            },
            child: const Text('send email verfication'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              // ignore: use_build_context_synchronously
              context.read().add(const AuthEventLogOut());
            },
            child: const Text('Restart'),
          )
        ],
      ),
    );
  }
}
