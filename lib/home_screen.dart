import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/bloc_cubit/counter_block.dart';
import 'package:practice_block_one/bloc_cubit/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Simple bloc'),centerTitle: true,),
      body: BlocBuilder<CounterBloc,CounterState>(builder: (context, state) {
        return Center(
          child: Text(
             counterBloc.counter.toString(),style: const TextStyle(fontSize: 50),
          ),
        );
      },),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.remove),
            onPressed: (){
              counterBloc.decrease();
            },
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
            onPressed: (){
              counterBloc.inCrease();
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
