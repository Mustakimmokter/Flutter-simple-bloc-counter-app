import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_block_one/simple_crud/bloc/crud_bloc.dart';
import 'package:practice_block_one/simple_crud/bloc/crud_event.dart';
import 'package:practice_block_one/simple_crud/bloc/crud_state.dart';

class CrudScreen extends StatelessWidget {
  const CrudScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CrudBloc>(
      create: (context) => CrudBloc(),
      child: CrudBody(),
    );
  }
}


class CrudBody extends StatelessWidget {
  CrudBody({Key? key}) : super(key: key);

  final nameCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  late TextEditingController editNumberCtrl;
  late TextEditingController editNameCtrl = TextEditingController();
  late CrudBloc _crudBloc;

  @override
  Widget build(BuildContext context) {
    _crudBloc = BlocProvider.of<CrudBloc>(context);
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
                 BlocBuilder(
                   bloc: _crudBloc,
                   builder: (context, state) {
                     if(state is RequiredData){
                       return const Text('Required number',style: TextStyle(color: Colors.red),);
                     }else{
                       return const SizedBox();
                     }
                   },
                 ),

                  const SizedBox(height: 20),
                  // Button
                  SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: MaterialButton(
                      color: Colors.green,
                      disabledColor: Colors.grey,
                      onPressed: () {
                        _crudBloc.add(AddCrud(contact: numberCtrl.text));
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
            BlocBuilder<CrudBloc, CrudState>(
              bloc: _crudBloc,
              builder: (context, state) {
                if(_crudBloc.contacts.isEmpty){
                  return const Center(child: Text('No Contacts'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: _crudBloc.contacts.length,
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
                                  _crudBloc.contacts[index],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                            Row(
                              children: [

                                // Edit
                                IconButton(
                                  onPressed: (){
                                    editNumberCtrl = TextEditingController(text: _crudBloc.contacts[index]);
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
                                                color: Colors.green,
                                                disabledColor: Colors.grey,
                                                onPressed: () {
                                                  _crudBloc.add(UpdateCrud(index: index, contact: editNumberCtrl.text));
                                                  Navigator.pop(context);

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
                                    _crudBloc.add(RemoveCrud(index: index));
                                  },
                                  icon: const Icon(Icons.delete,size: 20,color: Colors.red,),
                                  splashRadius: 25,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}