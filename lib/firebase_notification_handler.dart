import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';

class firebaseNotificationHanlder{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future <void> initialization()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

 Future<String?>getToken()async{
    final String? token =await messaging.getToken();
    print(token);
    return token;
 }
}