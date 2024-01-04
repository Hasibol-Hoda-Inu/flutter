import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/api/apiClient.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  Map <String, String>formValues={'email':'','firstName':'','lastName':'','mobile':'','password':'','photo':'', 'cpassword':'',};

  bool loading =false;

  inputOnchange(key, textValue){
    setState(() {
      formValues.update(key, (value) => textValue);
    });
  }

 formOnsubmission()async{
  if (formValues['email']!.isEmpty){
    errorToast('write your email');
  }
  else if(formValues['firstName']!.isEmpty){
    errorToast('Write your fist name');
  }
  else if(formValues['lastName']!.isEmpty){
    errorToast('write your last name');
  }
  else if (formValues['mobile']!.isEmpty){
    errorToast('write your mobile number');
  }
  else if (formValues['password']!.isEmpty){
    errorToast('give a strong password');
  }
  else if(formValues['password']!=formValues['cpassword']){
    errorToast('Password should be same');
  }
  else {
    setState(() {
      loading=true;
    });
    bool res= await registrationRequest(formValues);
    if( res==true){
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }else{
      setState(() {
        loading=false;
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
                   Text('Join with us', style: headText1(colorDarkBlue),),
                   const SizedBox(height: 20,),
                   TextFormField(
                     onChanged: (textValue){
                       inputOnchange('email', textValue);
                     },
                     decoration: appInputDecoration('Email'),),
                   const SizedBox(height: 20,),
                   TextFormField(
                     onChanged: (textValue){
                       inputOnchange('firstName', textValue);
                     },
                     decoration: appInputDecoration('First Name'),),
                   const SizedBox(height: 20,),
                   TextFormField(
                     onChanged: (textValue){
                       inputOnchange('lastName', textValue);
                     },
                     decoration: appInputDecoration('Last Name'),),
                   const SizedBox(height: 20,),
                   TextFormField(
                     onChanged: (textValue){
                       inputOnchange('mobile', textValue);
                     },
                     decoration: appInputDecoration('Mobile'),),
                   const SizedBox(height: 20,),
                   TextFormField(
                     onChanged: (textValue){
                       inputOnchange('password', textValue);
                     },
                     decoration: appInputDecoration('Password'),),
                   const SizedBox(height: 20,),
                   TextFormField(
                     onChanged: (textValue){
                       inputOnchange('cpassword', textValue);
                     },
                     decoration: appInputDecoration('Confirm Password'),),
                   const SizedBox(height: 20,),
                   ElevatedButton(
                     onPressed: (){
                       formOnsubmission();
                     },
                     style: appButtonStyle(),
                     child: successButton('Register', String),
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
         )))
       ],
     ),
    );
  }
}
