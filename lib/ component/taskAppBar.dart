import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

import '../utility/utility.dart';

AppBar taskAppBar(context,appBarUserData){
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: Image.memory(showBase64Image(appBarUserData['photo'])),
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${appBarUserData['firstName']}${appBarUserData['lastName']}"),
              Text("$appBarUserData['email']"),
            ],
          )
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: ()async{
            await removeToken();
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          },
          icon: const Icon(Icons.logout),
      )
    ],
  );
}