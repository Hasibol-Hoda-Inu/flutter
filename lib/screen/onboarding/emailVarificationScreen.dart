import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

class emailVarificationScreen extends StatefulWidget {
  const emailVarificationScreen({super.key});

  @override
  State<emailVarificationScreen> createState() => _emailVarificationScreenState();
}

class _emailVarificationScreenState extends State<emailVarificationScreen> {
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
                Text('Your Email Address', style: headText1(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text('A 6 digit verification pin will send to your email address', style: headText6(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration('Email'),),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){},
                    child: successButton('Send', String),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
