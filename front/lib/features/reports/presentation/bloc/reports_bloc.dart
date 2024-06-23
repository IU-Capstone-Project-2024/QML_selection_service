import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(ReportsState()) {
    on<ReportsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
