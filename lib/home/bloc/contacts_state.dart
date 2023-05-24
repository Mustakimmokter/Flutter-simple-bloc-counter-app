import 'package:equatable/equatable.dart';

abstract class ContactsState extends Equatable {}

class GetContacts extends ContactsState {
  @override
  List<Object?> get props => [];
}

class AddContactState extends ContactsState {
  AddContactState({required this.contact});

  final String contact;

  @override
  List<Object?> get props => [contact];
}

class UpdateContactState extends ContactsState {
  UpdateContactState({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class RemoveContactState extends ContactsState {
   RemoveContactState({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class ContactsIsEmpty extends ContactsState {
  @override
  List<Object?> get props => [];
}

class NumberIsEmpty extends ContactsState {
  @override
  List<Object?> get props => [];
}