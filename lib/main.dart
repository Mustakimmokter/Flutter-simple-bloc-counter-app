import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:practice_block_one/bloc_cubit/counter_block.dart';
import 'package:practice_block_one/home/home_screen.dart';
import 'package:practice_block_one/review/bloc/review_bloc.dart';
import 'package:practice_block_one/review/ui/screen/review_screen.dart';
import 'package:practice_block_one/shared/internet/internet_cubit.dart';
import 'package:practice_block_one/shared/internet/internet_state.dart';
import 'package:practice_block_one/shared/splash_screen.dart';
import 'package:practice_block_one/simple_crud/screen.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.development');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc(),),

        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: Connectivity()),),
      ],
      child: BlocListener<InternetCubit,InternetConnectionState>(
        listener: (_, state) {
          if(state is InternetDisconnected){
            print('Disconnected Internet................');
            //ShowInternetMassage.showInternetMessage(context);
          }
        },
        child: MaterialApp(
          title: 'Flutter Bloc pattern',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: CrudScreen(),
        ),
      ),
    );
  }
}

class ShowInternetMassage{
  static void showInternetMessage(BuildContext context){
    showDialog(
      context: context, builder: (context) {
      return const AlertDialog(
        title: Text('No Internet'),
      );
    },
      barrierDismissible: false,
    );
  }
}