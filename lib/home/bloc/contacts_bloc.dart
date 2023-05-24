
import 'package:bloc/bloc.dart';
import 'package:practice_block_one/home/bloc/contacts_event.dart';
import 'package:practice_block_one/home/bloc/contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState>{
   ContactsBloc(): super(ContactsIsEmpty()){

     on(_addContact);

     on(_removeContact);

     on(_updateContact);
   }
   
   void _addContact(ContactsAdd even, Emitter<ContactsState> emit) {
     if(even.number.isNotEmpty){
       emit(AddContactState(contact: even.number));
       contacts.add(even.number);
       if(state is AddContactState){
         emit(GetContacts());
       }
     }else{
       emit(NumberIsEmpty());
     }

   }

   void _removeContact(ContactsRemove event,Emitter<ContactsState> emit) {
   if(contacts.isNotEmpty){
     contacts.removeAt(event.index);
     emit(RemoveContactState(index: event.index));
     if(state is RemoveContactState){
       emit(GetContacts());
     }
   }

   }

   void _updateContact(ContactsUpdate event,Emitter<ContactsState> emit) {
     emit(UpdateContactState(index: event.index));
     contacts[event.index] = event.contact;
    if(state is UpdateContactState){
      emit(GetContacts());
    }

   }

   List <String> contacts = [];
}