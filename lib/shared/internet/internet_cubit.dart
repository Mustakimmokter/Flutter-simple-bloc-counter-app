import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/shared/internet/enum.dart';
import 'package:practice_block_one/shared/internet/internet_state.dart';

class InternetCubit extends Cubit<InternetConnectionState>{
  InternetCubit({required this.connectivity}):super(InternetConnectionChecking(),){

    getInternetConnection();

  }

  void getInternetConnection(){
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if(connectivityResult == ConnectivityResult.wifi){
        emitInternetConnection(ConnectionType.wifi);
        print('wifi');
      }else if(connectivityResult == ConnectivityResult.mobile){
        emitInternetConnection(ConnectionType.mobile);
        print('mobile');
      }else if(connectivityResult == ConnectivityResult.none){
        print('no Device');
        emitInternetDisconnection();
      }
    });
  }


  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  void emitInternetConnection(ConnectionType connectionType)=>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnection()=>emit(InternetDisconnected());
}