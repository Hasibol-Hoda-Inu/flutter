import 'package:flutter/material.dart';

class EmailFragment extends StatefulWidget {
  const EmailFragment({Key? key}) : super(key: key);

  @override
  State<EmailFragment> createState() => _EmailFragmentState();
}

class _EmailFragmentState extends State<EmailFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email Fragment', style: TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
