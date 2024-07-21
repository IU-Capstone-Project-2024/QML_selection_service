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

class SetAmount extends AppEvent {
  final int count;
  SetAmount({
    required this.count,
  });
}

class MakeAttempt extends AppEvent {}

class Logout extends AppEvent {}

class DownloadReports extends AppEvent {
  final String token;

  DownloadReports({required this.token});
}

class AddReport extends AppEvent {
  final Report report;

  AddReport({required this.report});
}

class DeleteReport extends AppEvent {
  final String url;
  DeleteReport({required this.url});
}

class AmountOfReports extends AppEvent {}

class MinusAttempt extends AppEvent {}

class BuyReports extends AppEvent {
  final int amount;
  BuyReports({required this.amount});
}
