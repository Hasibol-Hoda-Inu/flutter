import 'package:flutter/material.dart';

class signInScreen extends StatelessWidget {
  const signInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('images/enuLogo.png',width: 70,),
            const SizedBox(height: 40,),
            const Text('ache kichu ekta hob ekhane pore diboni'),
            const SizedBox(height: 10,),

            TextFormField(
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
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Sing up'),
            )

          ],
        ),
      ),
    );
  }
}
