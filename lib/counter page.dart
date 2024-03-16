import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class counter extends StatelessWidget {
  const counter({super.key});

  @override
  Widget build(BuildContext context) {

    final controller C=Get.put(controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text('counter page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text('Click: ${C.count}'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          C.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
