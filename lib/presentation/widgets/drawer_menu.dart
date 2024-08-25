import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
              tileColor: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.data_exploration_outlined),
              title: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}