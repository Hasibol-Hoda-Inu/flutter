import 'package:flutter/material.dart';
import 'package:task_manager_with_rest_api/style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
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
               Text('Join with us', style: headText1(colorDarkBlue),),
               const SizedBox(height: 20,),
               TextFormField(decoration: appInputDecoration('Email'),),
               const SizedBox(height: 20,),
               TextFormField(decoration: appInputDecoration('First Name'),),
               const SizedBox(height: 20,),
               TextFormField(decoration: appInputDecoration('Last Name'),),
               const SizedBox(height: 20,),
               TextFormField(decoration: appInputDecoration('Mobile'),),
               const SizedBox(height: 20,),
               TextFormField(decoration: appInputDecoration('Password'),),
               const SizedBox(height: 20,),
               ElevatedButton(
                 onPressed: (){},
                 style: appButtonStyle(),
                 child: successButton('Register', String),

               )
             ],
           ),
         )
       ],
     ),
    );
  }
}
