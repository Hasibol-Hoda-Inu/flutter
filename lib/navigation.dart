import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navigation extends StatelessWidget {
  const navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.toNamed('/counter_page');
                },
                child: const Text('Counter page'))
          ],
        ),
      ),
    );
  }
}
