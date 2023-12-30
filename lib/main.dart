import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'home screen.dart';
import 'theming.dart';

void main(){
  runApp(MyCounterApp());
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themes().lightTheme,
      darkTheme: themes().darkTheme,
      themeMode: ThemeMode.system,

      initialRoute: '/homeScreen',
      routes: {
        '/':(context)=> homeScreen(),
      },
    );
  }
}
