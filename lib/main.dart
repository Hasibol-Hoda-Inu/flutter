import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager_with_rest_api/screen/task/newTaskScreen.dart';
import 'package:task_manager_with_rest_api/utility/utility.dart';

import 'screen/onboarding/loginScreen.dart';
import 'screen/onboarding/registrationScreen.dart';
import 'screen/onboarding/splashScreen.dart';
import 'screen/onboarding/pinVarificationScreen.dart';
import 'screen/onboarding/emailVarificationScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await readUserData('token');

  if(token==null){
    runApp(const MyApp('/login'));
  }else{
    runApp(const MyApp('/newTaskScreen'));
  }
  
}

class MyApp extends StatelessWidget {
  final String firstRoute;
  const MyApp(this.firstRoute, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: firstRoute,
      routes: {
        '/':(context)=> const splashScreen(),
        '/login':(context)=> const loginScreen(),
        '/registration':(context)=> const registrationScreen(),
        '/emailVarification':(context)=> const emailVarificationScreen(),
        '/pinVarification':(context)=> const pinVarificationScreen(),
        '/setPassword':(context)=> const setPasswordScreen(),
        '/newTaskScreen':(context)=> const taskScreen(),

      },
    );
  }
}
