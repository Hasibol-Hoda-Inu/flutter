import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_with_rest_api/api/apiClient.dart';
import 'package:task_manager_with_rest_api/style/style.dart';
import 'package:task_manager_with_rest_api/utility/utility.dart';

class pinVarificationScreen extends StatefulWidget {
  const pinVarificationScreen({super.key});

  @override
  State<pinVarificationScreen> createState() => _pinVarificationScreenState();
}

class _pinVarificationScreenState extends State<pinVarificationScreen> {

  Map <String, String> formValues={'OTP':''};

  bool loading=false;

  inputOnChange(key, textValue){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }

  formOnSubmission()async{
    if(formValues['OTP']!.isEmpty){
      errorToast('OTP required');
    }
    else{
      setState(() {
        loading= true;
      });
      String? email = await readUserData('emailVerification');
      bool res= await verifyOTP(email, formValues['OTP']);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, '/setPasswordScreen', (route) => false);
      }
      else{
        setState(() {
          loading= false;
        });
      }
    }
  }


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
                ),
                const SizedBox(height: 60,),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? ',style: TextStyle(color: colorLightGray),),
                      // const SizedBox(width: 5),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Sign in', style: TextStyle(color: colorGreen),),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
