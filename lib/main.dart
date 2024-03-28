import 'dart:io';

import 'package:counter_app_with_getx/match%20update.dart';
import 'package:counter_app_with_getx/navigation.dart';
import 'package:counter_app_with_getx/sign%20in.dart';
import 'package:counter_app_with_getx/sign%20up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter page.dart';
import 'home screen.dart';
import 'theming.dart';
import 'firebase_notification_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAsG-BZIH3Pw68WAyJASf-9Sqrya0EVytQ',
        appId: "1:568368059464:android:a9cc66facb9060f8a7347d",
        messagingSenderId: '568368059464',
        projectId: "practice-project-1-5d4c2",
    ),)
      : await Firebase.initializeApp();
  await firebaseNotificationHanlder().initialization();
  print(firebaseNotificationHanlder().getToken());
  runApp(MyCounterApp());
}

class MyCounterApp extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themes().lightTheme,
      darkTheme: themes().darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => signUpScreen(),),
        GetPage(name: '/sign_in', page: ()=> signInScreen(),),
        GetPage(name: '/home_screen', page: () => homeScreen(), transition: Transition.leftToRight),
        GetPage(name: '/navigation', page: () => navigation(), transition: Transition.rightToLeft),
        GetPage(name: '/counter_page', page: () => counter(), transition: Transition.rightToLeft),
        GetPage(name: '/match_update', page: () => matchUpdate(), transition: Transition.rightToLeft),
      ],
    );
  }
}
