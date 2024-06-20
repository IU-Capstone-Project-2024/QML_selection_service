import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/enums/state.dart';

import 'presintation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 500,
        color: Colors.grey,
        child: const Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'Sign In',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(
              height: 90,
            ),
            _EmailInput(),
            SizedBox(
              height: 30,
            ),
            _PasswordInput(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SignupButton(),
                SizedBox(width: 20,),
                _EnterButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) => Container(
        width: 300,
        decoration: const BoxDecoration(color: Colors.blue),
        child: TextFormField(
        onChanged: (email) => context.read<LoginBloc>().add(LoginEmailChanged(email: email)),
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.password != curr.password,
      builder: (context, state) => Container(
        width: 300,
        decoration: const BoxDecoration(color: Colors.blue),
        child: TextFormField(
          onChanged:(password) =>  context.read<LoginBloc>().add(LoginPasswordChanged(password: password)),
          decoration: const InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.white),
          ),
          obscureText: true,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _EnterButton extends StatelessWidget {
  const _EnterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          if (state.state != InputState.inProgress) {
            context.read<LoginBloc>().add(LoginWithEmail());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreenAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          minimumSize: const Size(150,60),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: (state.state != InputState.inProgress)
            ? const Text('Enter')
            : const CircularProgressIndicator(
                color: Colors.white,

              ),
      ),
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreenAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        minimumSize: const Size(150, 60),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: const Text('SignUp'),
    );
  }
}
