import 'package:counter_app_with_getx/navigation.dart';
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
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Get.snackbar("Hey! what's up", "Happy new year bro");
                },
                child: const Text('Snack bar'),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.defaultDialog(
                      title: 'Do you want to delete?',
                      titlePadding: const EdgeInsets.all(10),

                      textCancel: 'No',
                      textConfirm: 'Yes',

                      onConfirm: ()=>{Get.back(closeOverlays: true)},
                    );
                  },
                  child: const Text('Dialogue Box')
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.bottomSheet(
                        Container(
                          height: 300,
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                          ),
                          child: const Column(
                            children: [
                              Text("this is my bottom sheet you idiot"),
                            ],
                          ),
                        )
                    );
                  },
                  child: const Text('Bottom sheet')
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.toNamed('/navigation');
                  },
                  child: const Text('Navigation')),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    Get.toNamed('/match_update');
                  },
                  child: const Text('Match Update')
              )
            ],
          ),
    ),
    );
  }
}
