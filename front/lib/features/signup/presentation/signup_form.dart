import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/core/routing/navigation.dart';
import 'package:front/common/enums/state.dart';
import 'presentation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.state == InputState.successful) {
          context.closeCurrentPage();
        }
      },
      child: Center(
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
                'Sign Up',
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
              _SignupButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) => Container(
        width: 300,
        decoration: const BoxDecoration(color: Colors.blue),
        child: TextFormField(
          onChanged: (email) => context.read<SignupBloc>().add(
                SignupEmailChanged(email: email),
              ),
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
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (prev, curr) => prev.password != curr.password,
      builder: (context, state) => Container(
        width: 300,
        decoration: const BoxDecoration(color: Colors.blue),
        child: TextFormField(
          onChanged: (password) => context
              .read<SignupBloc>()
              .add(SignupPasswordChanged(password: password)),
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

class _SignupButton extends StatelessWidget {
  const _SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          context.read<SignupBloc>().add(Registration());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreenAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          minimumSize: const Size(150, 60),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: (state.state != InputState.inProgress)
            ? const Text('Confirm')
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
