part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String id,
    @Default(false) bool isVerified,
    @Default(0) int counter,
    @Default(<Report>[]) List<Report> reports,
    @Default(InputState.initial) InputState state,
  }) = _AppState;
}
