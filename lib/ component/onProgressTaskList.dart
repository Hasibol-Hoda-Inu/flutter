import 'package:flutter/material.dart';

class onPregressTaskList extends StatefulWidget {
  const onPregressTaskList({super.key});

  @override
  State<onPregressTaskList> createState() => _onPregressTaskListState();
}

class _onPregressTaskListState extends State<onPregressTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('on progress'),
      ),
    );
  }
}
