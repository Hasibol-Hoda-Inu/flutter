import 'package:flutter/material.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({super.key});

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('completed'),
      ),
    );
  }
}
