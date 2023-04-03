import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/bloc_cubit/counter_state.dart';

class CounterBloc extends Cubit<CounterState>{
  int counter = 0;
  CounterBloc() : super(CounterInit());

    void inCrease() {
      counter = counter + 1;
      emit(CounterUpdated(counter: counter));
    }

    void decrease() {
      if(counter > 0){
        counter = counter - 1;
      }
      emit(CounterUpdated(counter: counter));
    }



}