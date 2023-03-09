// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:notes/models/notes_model.dart';
// import 'package:notes/pages/edit_page.dart';
// import 'package:notes/states.dart';
// Widget NotesItem({
//   required BuildContext context,
//   required TodoListModel item,
//   required void Function() delete,
// }){
//   return Container(
//     margin: EdgeInsets.all(5),
//     height: 90,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       color: Colors.blue,
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(item.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(item.currentTime,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20), maxLines: 2,),
//               Text(item.note),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }
