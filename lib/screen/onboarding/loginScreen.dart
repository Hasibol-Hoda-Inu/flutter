import 'package:flutter/material.dart';

import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                  Text('Get started with', style: headText1(colorDarkBlue),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    initialValue: '',
                    decoration: appInputDecoration('Email Address'),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: appInputDecoration("Password"),
                  keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){},
                      style: appButtonStyle(),
                      child: successButton('Login', String),

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
