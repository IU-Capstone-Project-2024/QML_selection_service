import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:front/app/bloc/report.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../common/enums/state.dart';
import '../../core/routing/navigation.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<CreateUser>(_onCreateUser);
    on<SetAmount>(_onSetAmount);
    on<MakeAttempt>(_onMakeAttempt);
    on<Logout>(_onLogout);
    on<DownloadReports>(_onDownloadReports);
    on<AddReport>(_onAddReport);
    on<DeleteReport>(_onDeleteReport);
    on<AmountOfReports>(_onGetAmountOfReports);
    on<MinusAttempt>(_onMinusAttempt);
    on<BuyReports>(_onBuyReports);
  }

  Future<void> _onBuyReports(BuyReports event, Emitter<AppState> emit) async {
    final url = 'http://localhost:8181/api/payment/checkout';
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${state.id}",
    };
    final body = jsonEncode({
      "price": "3000",
      "attemps": event.amount,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Successfully bought reports');
        emit(state.copyWith(state: InputState.successful));
        NavigationManager.goToPage(response.body);
      } else {
        print('Failed to buy reports with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        emit(state.copyWith(state: InputState.error));
      }
    } catch (e) {
      print('Exception occurred while buying reports: $e');
      emit(state.copyWith(state: InputState.error));
    }
  }

  void _onMinusAttempt(MinusAttempt event, Emitter<AppState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _onGetAmountOfReports(AppEvent event, Emitter<AppState> emit) async {
    final url = 'http://localhost:8181/api/user';
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${state.id}"
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (kDebugMode) {
          print(data);
        }
        final int attempts = data['attemps'] ?? 0;
        emit(state.copyWith(counter: attempts));
      } else {
        print(
            'Failed to get amount of reports with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred while getting amount of reports: $e');
    }
  }

  void _onDeleteReport(DeleteReport event, Emitter<AppState> emit) async {
    emit(state.copyWith(state: InputState.initial));
    final url = 'http://localhost:8181/api/delete';
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${state.id}",
    };
    final body = {
      "url": event.url,
    };

    print('Deleting report with ID: ${url}');
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print('Report deleted successfully');
      } else {
        print('Failed to delete report with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred while deleting report: $e');
    }
    var l = <Report>[];
    for (var i in state.reports) {
      if (i.url != event.url) l.add(i);
    }
    emit(state.copyWith(state: InputState.successful, reports: l));
  }

  void _onCreateUser(CreateUser event, Emitter<AppState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        password: event.password,
        id: event.id,
        isVerified: true,
      ),
    );
  }

  void _onSetAmount(SetAmount event, Emitter<AppState> emit) {
    emit(state.copyWith(counter: state.counter + event.count));
  }

  void _onMakeAttempt(MakeAttempt event, Emitter<AppState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _onLogout(Logout event, Emitter<AppState> emit) {
    emit(state.copyWith(
        email: '',
        password: '',
        id: '',
        isVerified: false,
        counter: 0,
        state: InputState.initial,
        reports: []));
  }

  void _onAddReport(AddReport event, Emitter<AppState> emit) {
    List<Report> rep = state.reports.map((_) => _).toList();
    rep.add(event.report);
    emit(state.copyWith(reports: rep));
  }

  void _onDownloadReports(DownloadReports event, Emitter<AppState> emit) async {
    final url = 'http://localhost:8181/api/getAllFiles';
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${event.token}"
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<Report> reports =
            jsonData.map((data) => Report.fromJson(data)).toList();

        if (kDebugMode) {
          print('Reports:');
          for (var report in reports) {
            print(
                'ID: ${report.id}, URL: ${report.url}, Created At: ${report.created_at}');
          }
        }
        emit(state.copyWith(state: InputState.successful, reports: reports));
      } else {
        if (kDebugMode) {
          print('Failed to load reports with status: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception occurred while fetching reports: $e');
      }
    }
  }
}
