part of 'login_bloc.dart';

class LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  final String email;
  LoginEmailChanged({required this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({required this.password});
}

class LoginWithEmail extends LoginEvent {}

class LoginInitial extends LoginEvent {}