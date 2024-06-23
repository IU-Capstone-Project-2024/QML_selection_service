part of 'signup_bloc.dart';

class SignupEvent {}

class SignupEmailChanged extends SignupEvent {
  final String email;

  SignupEmailChanged({required this.email});
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged({required this.password});
}

class Registration extends SignupEvent {}
