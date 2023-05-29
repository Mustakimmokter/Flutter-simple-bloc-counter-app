import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:practice_block_one/bloc_cubit/counter_block.dart';
import 'package:practice_block_one/languages/languages_loader.g.dart';
import 'package:practice_block_one/shared/internet/internet_cubit.dart';
import 'package:practice_block_one/shared/internet/internet_state.dart';
import 'package:practice_block_one/simple_crud/screen.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: '.env.development');
  runApp( EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('bn', 'BD')],
      path: 'assets/languages',
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      startLocale: const Locale('bn'),
      assetLoader: const LanguagesLoader(),
      child: const MyApp()
  ),);
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
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
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