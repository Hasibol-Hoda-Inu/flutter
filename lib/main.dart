import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

void main (){
  runApp(const SumApp());
}

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
