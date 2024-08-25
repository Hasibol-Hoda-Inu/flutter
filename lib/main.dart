import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.system
    );
  }
}
