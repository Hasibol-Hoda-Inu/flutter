import 'package:flutter/material.dart';

import '../../ component/appBottomNav.dart';
import '../../ component/canceledTaskList.dart';
import '../../ component/completedTaskList.dart';
import '../../ component/newTaskList.dart';
import '../../ component/onProgressTaskList.dart';
import '../../ component/taskAppBar.dart';
import '../../utility/defaultProfileImg.dart';
import '../../utility/utility.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  Map <String, String> appBarUserData= {
    'email': '',
    'firstName': '',
    'lastName': '',
    'mobile': '',
    'photo': 'userDefaultPic'
  };

  int bottomNavbarItemIndex=0;

  navOnTab(int index){
    setState(() {
      bottomNavbarItemIndex=index;
    });
  }

  final widgetOptions=[
    const newTaskList(),
    const completedTaskList(),
    const canceledTaskList(),
    const onPregressTaskList(),
  ];

  @override
  initState(){
    readAppBarUserData();
    super.initState();
  }
  readAppBarUserData() async {
    String? email= await readUserData('email');
    String? firstName= await readUserData('firstName');
    String? lastName= await readUserData('lastName');
    String? mobile= await readUserData('mobile');
    String? photo= await readUserData('photo');
    setState(() {
      appBarUserData={
        'email': '$email',
        'firstName': '$firstName',
        'lastName': '$lastName',
        'mobile': '$mobile',
        'photo': "$photo"
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context,appBarUserData),
      body: widgetOptions.elementAt(bottomNavbarItemIndex),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/taskCreateScreen');
          },
          child: IconButton.filledTonal(
              onPressed: (){},
              icon: const Icon(Icons.add)
          ),
      ),
      bottomNavigationBar: bottomNav(bottomNavbarItemIndex, navOnTab),
    );
  }
}
