import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/items/addItem.dart';
import 'package:notes/items/itemOfToDoList.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/pages/edit_page.dart';
import 'package:notes/servise/pref_servis_list.dart';

class ToDoList extends StatefulWidget {
   ToDoList(this.model, {Key? key}) : super(key: key);
  TodoListModel model;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: PrefsList.readListString(),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                List<TodoListModel> notes = convertToModel(snapshot.data);
                return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context,index){
                      return itemOfTodoList(
                          context,
                          notes[index],
                              delete: (){
                            notes.removeAt(index);
                            Navigator.pop(context);
                            setState(() {});
                          }, //delete button
                              edit: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => EditPage(widget.model),
                                  )
                              );
                          },
                      );
                    });
              } else {
                return Center(child: Text(snapshot.error.toString()));
              }
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddItem()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

List<TodoListModel> convertToModel(List<String> listString){
  List<TodoListModel> list = [];
  listString.forEach((element){
    Map<String,dynamic> map = jsonDecode(element);
    var note = TodoListModel.fromJson(map);
    list.add(note);
  });
  return list;
}