import 'package:flutter/material.dart';

class canceledTaskList extends StatefulWidget {
  const canceledTaskList({super.key});

  @override
  State<canceledTaskList> createState() => _canceledTaskListState();
}

class _canceledTaskListState extends State<canceledTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('cancel'),
      ),
    );
  }
}
