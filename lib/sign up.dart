import 'package:counter_app_with_getx/home%20screen.dart';
import 'package:counter_app_with_getx/userAuth/firebaseUserAuthentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpScreen extends StatefulWidget {
  signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  final firbaseAuthService _auth=firbaseAuthService();

  TextEditingController _userNameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('images/enuLogo.png',width: 70,),
              const SizedBox(height: 40,),
              const Text('ache kichu ekta hob ekhane pore diboni'),
              const SizedBox(height: 10,),

              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'User name',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                    ),
              ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    _signUp();
                  },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                  child: const Text('Sing up'),
              )

            ],
          ),
        ),
      ),
    );
  }
  void _signUp()async{
    String username=_userNameController.text;
    String email=_emailController.text;
    String password=_passwordController.text;

    User? user= await _auth.signUpWithEmailAndPassword(email, password);

    if (user!=null){
      print('user is created');
      Get.toNamed('/home_screen');
    }else{
      print('error on signing up');
    }
  }
}
