import 'package:flutter/material.dart';
import 'package:front/common/background/background.dart';
import 'package:front/common/gradient_appbar/gradient_appbar.dart';

import 'package:front/core/di/di_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/features/signup/presentation/presentation.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
        title: 'QML Selection Service',
      ),
      body: BlocProvider<SignupBloc>(
        create: (BuildContext context) => getIt<SignupBloc>(),
        child: const Stack(
          children: [
            GradientBackground(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SignupForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
