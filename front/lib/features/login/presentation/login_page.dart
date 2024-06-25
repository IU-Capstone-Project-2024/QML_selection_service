import 'package:flutter/material.dart';
import 'package:front/features/login/presentation/login_form.dart';
import 'package:front/core/di/di_exports.dart';
import '../../../common/background/background.dart';
import '../../../common/gradient_appbar/gradient_appbar.dart';
import 'bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(title: 'QML Selection Service'),
      body: Stack(
        children: [
          const GradientBackground(),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => getIt<LoginBloc>(),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
