import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Getx Counter'),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                },
                icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,)
            )
        )
    );
  }
}
