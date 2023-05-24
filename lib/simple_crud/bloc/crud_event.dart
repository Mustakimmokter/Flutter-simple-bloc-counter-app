
import 'package:equatable/equatable.dart';

abstract class CrudEvent extends Equatable {}


class AddCrud extends CrudEvent {
  AddCrud({required this.contact});

  final String contact;

  @override
  List<Object?> get props => [contact];
}

class UpdateCrud extends CrudEvent {
  UpdateCrud({required this.index,required this.contact});

  final String contact;
  final int index;

  @override
  List<Object?> get props => [contact,index];
}

class RemoveCrud extends CrudEvent {
  RemoveCrud({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}