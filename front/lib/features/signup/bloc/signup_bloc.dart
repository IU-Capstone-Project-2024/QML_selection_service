import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:front/common/enums/state.dart';

import '../../authentication/domain/repository/repository.dart';

part 'signup_event.dart';

part 'signup_state.dart';

part 'signup_bloc.freezed.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this._authenticationRepository) : super(const SignupState()) {
    on<SignupEmailChanged>(_onSignupEmailChanged);
    on<SignupPasswordChanged>(_onSignupPasswordChanged);
    on<Registration>(_onRegistration);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onSignupEmailChanged(
    SignupEmailChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onSignupPasswordChanged(
    SignupPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  Future<void> _onRegistration(
    Registration event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(state: InputState.inProgress));
    await _authenticationRepository.signUp(
      email: state.email,
      password: state.password,
    );
    emit(
      state.copyWith(
        state: InputState.successful,
      ),
    );
  }
}
