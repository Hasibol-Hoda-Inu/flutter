import 'package:flutter/material.dart';

class BodyOfTablet extends StatelessWidget {
  const BodyOfTablet({
    super.key, required this.buttonWidth,
  });

  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('FLUTTER WEB.\nTHE BASICS', style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          const SizedBox(
            width: 350,
            child: Text('In this course we will go over the basics of using Flutter web for development. Topics will include Responsive Layout, Deploying, Font changes, Hover functionality, Modals and more.', style:
            TextStyle(
              fontSize: 18,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60,),
          SizedBox(
            width: buttonWidth,
            height: 50,
            child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1FE492),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),
                child: const Text('Join course', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),)),
          ),
        ],
      ),
    );
  }
}