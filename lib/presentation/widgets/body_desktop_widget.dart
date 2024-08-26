import 'dart:ui';

import 'package:flutter/material.dart';

class BodyDesktop extends StatelessWidget {
  const BodyDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FLUTTER WEB THE.\nTHE BASICS', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),),
                  SizedBox(
                    width: 350,
                    child: Text('In this course we will go over the basics of using Flutter web for development. Topics will include Responsive Layout, Deploying, Font changes, Hover functionality, Modals and more.', style: TextStyle(
                      fontSize: 18,
                    ),),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1FE492),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)
                            )
                        ),
                        child: const Text('Join course', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),)),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}