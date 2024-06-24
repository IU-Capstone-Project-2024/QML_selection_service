import 'package:bloc/bloc.dart';

part 'price_list_event.dart';
part 'price_list_state.dart';

class PriceListBloc extends Bloc<PriceListEvent, PriceListState> {
  PriceListBloc() : super(PriceListInitial()) {
    on<PriceListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
