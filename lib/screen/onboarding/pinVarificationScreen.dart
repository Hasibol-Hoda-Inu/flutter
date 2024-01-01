import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

class pinVarificationScreen extends StatefulWidget {
  const pinVarificationScreen({super.key});

  @override
  State<pinVarificationScreen> createState() => _pinVarificationScreenState();
}

class _pinVarificationScreenState extends State<pinVarificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackGround(context),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Pin Verification', style: headText1(colorDarkBlue),),
                const SizedBox(height: 10,),
                Text('A 6 digit verification pin will send to your email address', style: headText6(colorLightGray),),
                const SizedBox(height: 20,),
                PinCodeTextField(
                    appContext: context,
                    length: 6,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  pinTheme: OTPboxStyle(),
                  onCompleted: (v){},
                  onChanged: (value){},
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: appButtonStyle(),
                  onPressed: (){},
                  child: successButton('Verify', String),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
