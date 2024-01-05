import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

BottomNavigationBar bottomNav(currentIndex, navOnTab){
 return BottomNavigationBar(
   items: [
     BottomNavigationBarItem(
         icon: Icon(Icons.file_open_outlined),
         label: 'New Task',
     ),
     BottomNavigationBarItem(
       icon: Icon(Icons.task_alt_rounded),
       label: 'Completed',
     ),
     BottomNavigationBarItem(
       icon: Icon(Icons.folder_delete_outlined),
       label: 'Canceled',
     ),
     BottomNavigationBarItem(
       icon: Icon(Icons.access_time_rounded),
       label: 'Progress',
     ),
   ],
   onTap: navOnTab,
   currentIndex: currentIndex,
   type: BottomNavigationBarType.fixed,
   selectedItemColor: colorGreen,
   unselectedItemColor: colorDarkBlue,
 );
}