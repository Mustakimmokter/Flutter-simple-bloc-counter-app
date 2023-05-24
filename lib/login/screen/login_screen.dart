import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/login/bloc/login_bloc.dart';
import 'package:practice_block_one/login/bloc/login_event.dart';
import 'package:practice_block_one/login/bloc/login_state.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginField(),
    );
  }
}


// ignore: must_be_immutable
class LoginField extends StatelessWidget {
  LoginField({Key? key}) : super(key: key);

     final numberCtrl = TextEditingController();
     late LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: numberCtrl,
                // keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9]')
                  ),
                  LengthLimitingTextInputFormatter(11),
                ],
                decoration: const InputDecoration(
                  hintText: 'Enter number',
                ),
                onChanged: (value){
                  _loginBloc.add(CheckIsValidNumber(number: value));
                },
              ),
              SizedBox(height: 20),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: MaterialButton(
                      color: Colors.red,
                      disabledColor: Colors.grey,
                      onPressed: state is LoginNumberIsInValid ? null :
                          (){},
                      child: const Text('Login',style: TextStyle(color: Colors.white),),
                    ),
                  );
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
