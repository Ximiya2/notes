import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/notes_model.dart';

Widget itemOfTodoList(BuildContext context, TodoListModel item,
    {required void Function() delete, required void Function() edit}) {
  return Container(
    height: 65,
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    margin: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue.shade300,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            InkWell(
                onTap: () {
                  // PopupMenuButton(
                  //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  //     PopupMenuItem(
                  //       onTap: delete,
                  //       child: Text('Delete'),
                  //     ),
                  //     PopupMenuItem(
                  //       child: InkWell(
                  //           onTap: (){
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(builder: (context) =>  EditPage(item)),
                  //             );
                  //           },
                  //           child: Text('Edit')),
                  //     ),
                  //   ],
                  // );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Action'),
                          content: Text('What do you want?'),
                          actions: [
                            ElevatedButton(
                                onPressed: edit, child: Text('Edit')),
                            ElevatedButton(
                                onPressed: delete, child: Text('Delete')),
                          ],
                        );
                      });
                },
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black87,
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.note,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38),
            ),
            Text(
              item.currentTime,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38),
            ),
          ],
        )
      ],
    ),
  );
}