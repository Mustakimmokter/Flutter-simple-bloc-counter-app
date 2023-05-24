import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/home/bloc/contacts_bloc.dart';
import 'package:practice_block_one/home/bloc/contacts_event.dart';
import 'package:practice_block_one/home/bloc/contacts_state.dart';
import 'package:practice_block_one/shared/app_helper/api.dart';
import 'package:practice_block_one/shared/services/http_service.dart';
import 'package:practice_block_one/shared/services/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ContactsBloc(),
      child: HomeScreenBody(),
    );
  }
}

// ignore: must_be_immutable
class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({Key? key}) : super(key: key);

  final nameCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  late TextEditingController editNumberCtrl = TextEditingController();
  late TextEditingController editNameCtrl = TextEditingController();
  late ContactsBloc _contactsBloc;

  @override
  Widget build(BuildContext context) {
    _contactsBloc = BlocProvider.of<ContactsBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameCtrl,
                    // keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter name',
                    ),
                    onChanged: (value) {
                      value = nameCtrl.text;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: numberCtrl,
                    // keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter number',
                    ),
                    onChanged: (value) {
                      value = numberCtrl.text;
                    },
                  ),
                  const SizedBox(height: 5),
                  BlocBuilder<ContactsBloc, ContactsState>(
                    builder: (context, state) {
                      return state is NumberIsEmpty ? const Text('Required number',style: TextStyle(color: Colors.red),) : SizedBox();
                    },
                  ),
                  const SizedBox(height: 20),
                  // Button
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: MaterialButton(
                      color: Colors.red,
                      disabledColor: Colors.grey,
                      onPressed: () {
                        _contactsBloc.add(ContactsAdd(number: numberCtrl.text));
                        numberCtrl.clear();
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.grey,
            ),
            BlocBuilder<ContactsBloc, ContactsState>(
              builder: (context, state) {
                return Expanded(
                  child: state is GetContacts || state is RemoveContactState || state is NumberIsEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: _contactsBloc.contacts.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Number',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _contactsBloc.contacts[index],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                               Row(
                                 children: [

                                   // Edit
                                   IconButton(
                                     onPressed: (){
                                       //editNameCtrl = TextEditingController(text: _contactsBloc.contacts[index]);
                                       editNumberCtrl = TextEditingController(text: _contactsBloc.contacts[index]);
                                       showModalBottomSheet(context: context, builder: (context) {
                                         return  Padding(
                                           padding: const EdgeInsets.symmetric(
                                             horizontal: 20,
                                             vertical: 20,
                                           ),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               TextFormField(
                                                 controller: editNameCtrl,
                                                 // keyboardType: TextInputType.number,
                                                 decoration: const InputDecoration(
                                                   hintText: 'Edit name',
                                                 ),
                                                 onChanged: (value) {
                                                   value = editNameCtrl.text;
                                                 },
                                               ),
                                               const SizedBox(height: 10),
                                               TextFormField(
                                                 controller: editNumberCtrl,
                                                 // keyboardType: TextInputType.number,
                                                 decoration: const InputDecoration(
                                                   hintText: 'Edit number',
                                                 ),
                                                 onChanged: (value) {
                                                   value = editNumberCtrl.text;
                                                 },
                                               ),
                                               const SizedBox(height: 5),
                                               const Text('Required number',style: TextStyle(color: Colors.red),),
                                               const SizedBox(height: 20),
                                               // Save
                                               SizedBox(
                                                 width: double.maxFinite,
                                                 height: 40,
                                                 child: MaterialButton(
                                                   color: Colors.red,
                                                   disabledColor: Colors.grey,
                                                   onPressed: () {
                                                     Navigator.pop(context);
                                                     _contactsBloc.add(ContactsUpdate(index: index,contact: editNumberCtrl.text));
                                                   },
                                                   child: const Text(
                                                     'Submit',
                                                     style: TextStyle(color: Colors.white),
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         );
                                       },);
                                     },
                                     icon: const Icon(Icons.edit,size: 20,color: Colors.green,),
                                     splashRadius: 25,
                                   ),

                                   // Delete
                                   IconButton(
                                     onPressed: (){
                                       _contactsBloc.add(ContactsRemove(index: index));
                                     },
                                     icon: const Icon(Icons.delete,size: 20,color: Colors.red,),
                                     splashRadius: 25,
                                   ),
                                 ],
                               ),
                              ],
                            );
                          },
                        )
                      : const SizedBox(),
                );
              },
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: MaterialButton(
                color: Colors.red,
                disabledColor: Colors.grey,
                onPressed: () {
                  UserServices.getUsers();
                },
                child: const Text(
                  'Get Review',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
