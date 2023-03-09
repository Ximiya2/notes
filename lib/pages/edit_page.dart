import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/items/addItem.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/states.dart';

class EditPage extends StatefulWidget {
   EditPage(this.model, {Key? key}) : super(key: key);

  TodoListModel model;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  var titleEditCtr = TextEditingController();
  var textEditCtr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleEditCtr.text = widget.model.title;
    textEditCtr.text = widget.model.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit'),
      actions: [
        IconButton(onPressed: () async {
          var hour = DateTime.now().hour;
          var minute = DateTime.now().minute;
          String currentTime = '$hour:$minute';
          var newNote = TodoListModel(
              title: titleEditCtr.text,
              note: textEditCtr.text,
            currentTime: currentTime, );
          // notesList.add(newNote);
          if(titleEditCtr != '' && titleEditCtr != ''){

            setState(() {});
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Action'),
                    content: Text('Textni kiriting!'),
                  );
                });
          }

        }, icon: Icon(Icons.check))
      ]),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: titleEditCtr,
              decoration: InputDecoration(
                hintText: 'Enter title',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Text('Your text',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: textEditCtr,
              decoration: InputDecoration(
                hintText: 'Enter Your text',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
