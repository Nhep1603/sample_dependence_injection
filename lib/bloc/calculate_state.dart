part of 'calculate_bloc.dart';

class CalculateState extends Equatable {
  const CalculateState({required this.value});
  final int value;
  @override
  List<Object> get props => [value];
}
