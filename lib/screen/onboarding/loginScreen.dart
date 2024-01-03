import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';
import '../task/newTaskScreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  Map <String, String> formValues={'email':'', 'password':'',};

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
    else if(formValues['password']!.isEmpty){
      errorToast('give a password');
    }
    else{
      setState(() {
        loading= true;
      });
     bool res= await loginRequest(formValues);
     if(res==true){
       Navigator.pushNamedAndRemoveUntil(context, '/newTaskScreen', (route) => false);
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
            Container(
              alignment: Alignment.center,
                child: loading?(const Center(child: CircularProgressIndicator())):(SingleChildScrollView(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Get started with', style: headText1(colorDarkBlue),),
                      const SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (textValue){
                          inputOnChange('email', textValue);
                        },
                        decoration: appInputDecoration('Email Address'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (textValue){
                          inputOnChange('password', textValue);
                        },
                        decoration: appInputDecoration("Password"),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: (){
                          formOnSubmission();
                        },
                        style: appButtonStyle(),
                        child: successButton('Login', String),

                      ),
                      const SizedBox(height: 60,),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, '/emailVarification');
                              },
                              child: Text('Forget password?', style: headText6(colorLightGray),),
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                const SizedBox(width: 5,),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/registration');
                                  },
                                  child: const Text('Sign up', style: TextStyle(color: colorGreen),),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

            )))
          ],
      ),
    );
  }
}
