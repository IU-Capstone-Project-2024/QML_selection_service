part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default('') String email,
    @Default('') String password,
    @Default(InputState.initial) InputState state,
  }) = _SignupState;
}
