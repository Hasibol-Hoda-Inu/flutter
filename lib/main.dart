import 'package:flutter/material.dart';

import 'Fragments/EmailFragment.dart';
import 'Fragments/NotificationFragment.dart';
import 'Fragments/profileFragments.dart';
import 'Fragments/searchFragment.dart';
import 'Fragments/settingsFragment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TabBarFragment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('tabBarTabViewFragment'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_circle),text: 'profile',),
              Tab(icon: Icon(Icons.settings),text: "settings",),
              Tab(icon: Icon(Icons.search),text: 'search',),
              Tab(icon: Icon(Icons.email),text: 'Email',),
              Tab(icon: Icon(Icons.notifications_rounded),text: 'Notification',),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProfileFragment(),
            SettingsFragment(),
            SearchFragment(),
            EmailFragment(),
            NotificationFragment(),
          ],
        ),
      ),
    );
  }
}
