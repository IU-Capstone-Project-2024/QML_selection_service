import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web/common/enums/state.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginWithEmail>(_onLoginWithEmail);
  }

  void _onLoginWithEmail(
    LoginWithEmail event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(state: InputState.inProgress));
  }
}
