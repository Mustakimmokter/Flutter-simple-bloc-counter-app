
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginNumberIsValid extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginNumberIsInValid extends LoginState {
  @override
  List<Object?> get props => [];
}