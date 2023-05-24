
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/login/bloc/login_event.dart';
import 'package:practice_block_one/login/bloc/login_state.dart';
import 'package:practice_block_one/shared/app_helper/validator.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(): super(LoginNumberIsValid()){

    on((CheckIsValidNumber event,Emitter<LoginState> emit) async {

      emit(LoginNumberIsValid());
      if(Validators.isValidPhoneNumber(event.number)){
        emit(LoginNumberIsValid());
      }else{
        emit(LoginNumberIsInValid());
      }

    });
  }
}