part of 'demo_bloc.dart';

@freezed
class DemoState with _$DemoState {
  const factory DemoState({
    @Default(true) bool initial,
    @Default(false) bool medium,
    @Default(false) bool last,
    @Default('Wait 3 minutes') String message,
    @Default(false) bool prev,
    @Default(false) bool final_state,
    PlatformFile? file,
  }) = _DemoState;
}
