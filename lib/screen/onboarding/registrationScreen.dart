import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/api/apiClient.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  Map <String, String>formValues={'email':'','firstName':'','lastName':'','mobile':'','password':'','photo':''};

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
  else {
    setState(() {
      loading=true;
    });
    await registrationRequest(formValues);
    setState(() {
      loading=false;
    });
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
                   ElevatedButton(
                     onPressed: (){
                       formOnsubmission();
                     },
                     style: appButtonStyle(),
                     child: successButton('Register', String),

                   )
                 ],
               ),
         )))
       ],
     ),
    );
  }
}
