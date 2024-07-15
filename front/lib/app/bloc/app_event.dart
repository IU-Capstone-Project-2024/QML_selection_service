part of 'app_bloc.dart';

class AppEvent {}

class CreateUser extends AppEvent {
  CreateUser({
    required this.email,
    required this.password,
    required this.id,
  });

  final String email;
  final String password;
  final String id;
}
