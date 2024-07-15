import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'demo_event.dart';
part 'demo_bloc.freezed.dart';
part 'demo_state.dart';

@injectable
class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoState()) {
    on<ChooseTarget>(_onChooseTarget);
    on<AddPath>(_onAddPath);
    on<ListColumns>(_onListColumns);
    on<DownloadIndecator>(_onDownloadIndecator);
  }
  void _onChooseTarget(
    ChooseTarget event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(initial: false, medium: true));
  }

  void _onAddPath(
    AddPath event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(file: event.file));
  }

  void _onListColumns(
    ListColumns event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(medium: false, last: true));
  }

  void _onDownloadIndecator(
    DownloadIndecator event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(
      last: false,
      prev: true,
    ));
  }
}
