import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

class taskScreen extends StatefulWidget {
  const taskScreen({super.key});

  @override
  State<taskScreen> createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackGround(context),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                ListTile(
                  title: Text('testing'),
                  subtitle: Text('waiting to connect'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
