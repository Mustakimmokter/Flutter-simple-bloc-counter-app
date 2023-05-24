import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/main.dart';
import 'package:practice_block_one/review/ui/screen/review_screen.dart';
import 'package:practice_block_one/shared/internet/internet_cubit.dart';
import 'package:practice_block_one/shared/internet/internet_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit,InternetConnectionState>(
      listener: (context, state) {
        if(state is InternetDisconnected){
          print('No Internet.................');
          ShowInternetMassage.showInternetMessage(context);
        }else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const ReviewScreen()), (route) => false);
        }
      },
      child: const Scaffold(
        body: Center(
          child: FlutterLogo(size: 100,),
        ),
      ),
    );
  }
}

