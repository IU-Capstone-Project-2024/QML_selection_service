import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

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

  void _onLogout(Logout event, Emitter<AppState> emit){

    emit(state.copyWith(email: '', password: '',id:'',isVerified: false, counter: 0));
  }
}
