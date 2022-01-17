import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(const CalculateState(value: 0)) {
    on<CalculateEvent>((event, emit) {
      emit(CalculateState(value: state.value + 1));
    });
  }
}
