import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/simple_crud/bloc/crud_event.dart';
import 'package:practice_block_one/simple_crud/bloc/crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState>{
  CrudBloc():super(InitialCrud()){
    on(_addCrud);
    on(_deleteCrud);
    on(_updateCrud);
  }


  void _addCrud(AddCrud event, Emitter<CrudState> emit){

   if(event.contact.isNotEmpty){
     emit(AddCrudState());
     if(state is AddCrudState){
       contacts.add(event.contact);
       emit(GetCrud());
     }
   }else{
     emit(RequiredData());
   }
}

  void _deleteCrud(RemoveCrud event, Emitter<CrudState> emit){
    emit(RemoveCrudState());
    if(contacts.isNotEmpty){
      contacts.removeAt(event.index);
      emit(GetCrud());
    }
  }

  void _updateCrud(UpdateCrud event, Emitter<CrudState> emit){
    emit(UpdateCrudState());
    if(contacts.isNotEmpty){
      contacts[event.index] = event.contact;
      emit(GetCrud());
    }
  }

  List<String> contacts = [];

}