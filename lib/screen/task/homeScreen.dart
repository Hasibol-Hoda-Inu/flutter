import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

import '../../ component/appBottomNav.dart';
import '../../ component/canceledTaskList.dart';
import '../../ component/completedTaskList.dart';
import '../../ component/newTaskList.dart';
import '../../ component/onProgressTaskList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int bottomNavbarItemIndex=0;

  navOnTab(int index){
    setState(() {
      bottomNavbarItemIndex=index;
    });
  }

  final widgetOptions=[
    newTaskList(),
    completedTaskList(),
    canceledTaskList(),
    onPregressTaskList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homeScreen',style: TextStyle(color: colorWhite),),
        backgroundColor: colorGreen,
      ),
      body: widgetOptions.elementAt(bottomNavbarItemIndex),
      bottomNavigationBar: bottomNav(bottomNavbarItemIndex, navOnTab),
    );
  }
}
