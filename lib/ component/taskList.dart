import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

ListView taskListView(taskList, taskDeletePopup, statusChange){
  return ListView.builder(
    itemCount: taskList.length,
    itemBuilder: (context, index){

      Color statusColor=colorGreen;
      if(taskList[index]['status']=='New'){
        statusColor=colorBlue;
      }
      else if(taskList[index]['status']=='Progress'){
        statusColor=colorOrange;
      }
      else if(taskList[index]['status']=='Canceled'){
        statusColor=colorRed;
      }

      return Card(
        child: taskCardsStyle(
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(taskList[index]['title'], style: headText1(colorDarkBlue),),
             Text(taskList[index]['description'], style: headText6(colorLightGray),),
             Text(taskList[index]['createdDate'],style: headText6(colorLightGray),),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 statusChild(taskList[index]['status'],statusColor),
                 Container(
                   child: Row(
                     children: [
                       SizedBox(
                         child: IconButton.filledTonal(
                           onPressed: () {
                             statusChange(taskList[index]['_id']);
                           },
                           icon: const Icon(Icons.edit_location_outlined),
                         ),
                       ),
                       SizedBox(
                         child: IconButton.filledTonal(
                           onPressed:(){
                           taskDeletePopup(taskList[index]['_id']);
                         },
                           icon: const Icon(Icons.delete_outline),
                       ),
                       ),
                     ],
                   ),
                 )
               ],
             )
           ],
         )
        ),
      );
      },
  );
}