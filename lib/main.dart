import 'package:flutter/material.dart';

import 'Home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 5.0,
        )
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black54,
            foregroundColor: Colors.white70,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white24,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black45,
      )
      ),
      home: MyHomePage(),
    );
  }
}
