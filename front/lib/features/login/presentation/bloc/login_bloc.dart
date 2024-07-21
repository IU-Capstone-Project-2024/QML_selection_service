import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:front/common/enums/state.dart';

import '../../../authentication/domain/models/exceptions.dart';
import '../../../authentication/domain/repository/repository.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<LoginWithEmail>(_onLoginWithEmail);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginInitial>(_onLoginInitial);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onLoginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginWithEmail(
    LoginWithEmail event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(state: InputState.inProgress));
    try {
      var uid = await _authenticationRepository.loginWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(
        state.copyWith(
          state: InputState.successful,
          id: uid,
        ),
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          state: InputState.error,
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          state: InputState.error,
          errorMessage: 'Use correct email and password',
        ),
      );
    }
  }

  void _onLoginInitial(
    LoginInitial event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        state: InputState.initial,
        errorMessage: 'Use correct email and password',
      ),
    );
  }
}
