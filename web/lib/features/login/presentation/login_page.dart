import 'package:flutter/material.dart';
import 'package:web/features/login/presentation/login_form.dart';

import 'package:web/core/di/di_exports.dart';
import 'bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QML Selection Service'),
        backgroundColor: Colors.grey,
      ),
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => getIt<LoginBloc>(),
        child: const LoginForm(),
      ),
    );
  }
}
