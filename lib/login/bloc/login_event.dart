import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class CheckIsValidNumber extends LoginEvent{
  const CheckIsValidNumber({required this.number});
  final String number;

  @override
  List<Object?> get props => [number];

  @override
  String toString() => 'CheckIsValidNumber { phone no: $number}';
}