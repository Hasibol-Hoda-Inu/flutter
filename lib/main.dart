import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/screen/onboarding/setPasswordScreen.dart';

import 'screen/onboarding/loginScreen.dart';
import 'screen/onboarding/registrationScreen.dart';
import 'screen/onboarding/splashScreen.dart';
import 'screen/onboarding/pinVarificationScreen.dart';
import 'screen/onboarding/emailVarificationScreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: '/emailVarification',
      routes: {
        '/':(context)=> const splashScreen(),
        '/login':(context)=> const loginScreen(),
        '/registration':(context)=> const registrationScreen(),
        '/emailVarification':(context)=> const emailVarificationScreen(),
        '/pinVarification':(context)=> const pinVarificationScreen(),
        '/setPassword':(context)=> const setPasswordScreen(),

      },
    );
  }
}
