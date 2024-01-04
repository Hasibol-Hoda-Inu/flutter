import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

import '../../api/apiClient.dart';

class emailVarificationScreen extends StatefulWidget {
  const emailVarificationScreen({super.key});

  @override
  State<emailVarificationScreen> createState() => _emailVarificationScreenState();
}

class _emailVarificationScreenState extends State<emailVarificationScreen> {

  Map <String, String> formValues={'email':'',};
  bool loading=false;

  inputOnChange(key, textValue){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }

  formOnSubmission()async{
    if(formValues['email']!.isEmpty){
      errorToast('write your email address');
    }
    else{
      setState(() {
        loading= true;
      });
      bool res= await verifyEmail(formValues['email']);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, '/pinVarification', (route) => false);
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
