import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

ListView taskListView(taskList){
  return ListView.builder(
    itemCount: taskList.length,
    itemBuilder: (context, index){
      return Card(
        child: taskCardsStyle(
         Column(
           children: [
             Text(taskList[index]['title'], style: headText1(colorDarkBlue),),
             Text(taskList[index]['description'], style: headText6(colorLightGray),),
             Text(taskList[index]['createdDate'],style: headText6(colorLightGray),),
           ],
         )
        ),
      );
      },
  );
}