part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(InputState.initial) InputState state,
    @Default('Unknown error') String errorMessage,
  }) = _LoginState;
}
