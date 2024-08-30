import 'package:abolfazlnotes/constant/routes.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_bloc.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_event.dart';
import 'package:abolfazlnotes/services/auth/bloc/auth_state.dart';
import 'package:abolfazlnotes/services/auth/firebase_auth_provider.dart';
import 'package:abolfazlnotes/views/forgot_password_email.dart';
import 'package:abolfazlnotes/views/login_view.dart';
import 'package:abolfazlnotes/views/create_update_note_view.dart';
import 'package:abolfazlnotes/views/notes_view.dart';
import 'package:abolfazlnotes/views/register_view.dart';
import 'package:abolfazlnotes/views/verfiy_email_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const Homepage(),
      ),
      routes: {
        createOrUpadateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: FutureBuilder(
//         future: AuthService.firebase().initialize(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.done:
//               final user = AuthService.firebase().currentUser;
//               if (user != null) {
//                 if (user.isEmailVerified) {
//                   return const Notesview();
//                 } else {
//                   return const VerfiyEmailView();
//                 }
//               } else {
//                 return const Loginview();
//               }

//             default:
//               return const CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const Notesview();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerfiyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const Loginview();
        } else if (state is AuthStateRegistering) {
          return const Registerview();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
    // return BlocProvider(
    //   create: (context) => CounterBloc(),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Testing bloc'),
    //     ),
    //     body: BlocConsumer<CounterBloc, CounterState>(
    //       builder: (context, state) {
    //         final invalidValue =
    //             (state is CounterStateInvalidValueNumber) ? state.value : '';
    //         return Column(
    //           children: [
    //             Text('Current value=>${state.value}'),
    //             Visibility(
    //               visible: state is CounterStateInvalidValueNumber,
    //               child: Text('Invalid input: $invalidValue'),
    //             ),
    //             TextField(
    //               controller: _controller,
    //               decoration: const InputDecoration(hintText: 'Enter Number'),
    //               keyboardType: TextInputType.number,
    //             ),
    //             Row(
    //               children: [
    //                 TextButton(
    //                   onPressed: () {
    //                     context
    //                         .read<CounterBloc>()
    //                         .add(DecrementEvent(_controller.text));
    //                   },
    //                   child: const Text('-'),
    //                 ),
    //                 TextButton(
    //                   onPressed: () {
    //                     context
    //                         .read<CounterBloc>()
    //                         .add(IncrementEvent(_controller.text));
    //                   },
    //                   child: const Text('+'),
    //                 ),
    //               ],
    //             )
    //           ],
    //         );
    //       },
    //       listener: (context, state) {
    //         _controller.clear();
    //       },
    //     ),
    //   ),
    // );
  }
}

@immutable
abstract class CounterState {
  final int value;
  const CounterState(this.value);
}

class CounterStateInvalidValueNumber extends CounterState {
  final String invalidValue;
  const CounterStateInvalidValueNumber(
      {required this.invalidValue, required int previousValue})
      : super(previousValue);
}

class CounterStateValid extends CounterState {
  const CounterStateValid(super.value);
}

@immutable
abstract class CounterEvent {
  final String value;
  const CounterEvent(this.value);
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent(super.value);
}

class DecrementEvent extends CounterEvent {
  const DecrementEvent(super.value);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterStateValid(0)) {
    on<IncrementEvent>(
      (event, emit) {
        final integer = int.tryParse(event.value);
        if (integer == null) {
          emit(
            CounterStateInvalidValueNumber(
              invalidValue: event.value,
              previousValue: state.value,
            ),
          );
        } else {
          emit(CounterStateValid(state.value + integer));
        }
      },
    );
    on<DecrementEvent>(
      (event, emit) {
        final integer = int.tryParse(event.value);
        if (integer == null) {
          emit(
            CounterStateInvalidValueNumber(
              invalidValue: event.value,
              previousValue: state.value,
            ),
          );
        } else {
          emit(CounterStateValid(state.value - integer));
        }
      },
    );
  }
}
