import 'package:equatable/equatable.dart';

abstract class ContactsEvent extends Equatable {}

class ContactsAdd extends ContactsEvent{
  ContactsAdd({required this.number});

  final String number;
  @override
  List<Object?> get props => [number];
}

class ContactsRemove extends ContactsEvent {
  ContactsRemove({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class ContactsUpdate extends ContactsEvent {
  ContactsUpdate({required this.index, required this.contact});

  final int index;
  final String contact;

  @override
  List<Object?> get props => [index,contact];
}