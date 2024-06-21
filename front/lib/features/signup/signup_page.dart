import 'package:flutter/material.dart';

import 'package:front/core/di/di_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/features/signup/bloc/signup_bloc.dart';
import 'package:front/features/signup/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QML Selection Service'),
        backgroundColor: Colors.grey,
      ),
      body: BlocProvider<SignupBloc>(
        create: (BuildContext context) => getIt<SignupBloc>(),
        child: const SignupForm(),
      ),
    );
  }
}
