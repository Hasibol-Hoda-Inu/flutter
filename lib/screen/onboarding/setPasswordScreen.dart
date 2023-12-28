import 'package:flutter/material.dart';

import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackGround(context),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Set password', style: headText1(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text('Minimum length password 8 character with letter and number combination', style: headText6(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration('Password'),),
                const SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration('Confirm password'),),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){}, 
                    child: successButton('Confirm', String),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
