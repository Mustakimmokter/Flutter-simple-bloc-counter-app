
import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {}

class CounterInit extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterUpdated extends CounterState {
  CounterUpdated({required this.counter});
  final int counter;
  @override
  List<Object?> get props => [counter];

}