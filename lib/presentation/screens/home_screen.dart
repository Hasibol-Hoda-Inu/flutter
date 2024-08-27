import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController=TextEditingController();
  final double _result=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum App', style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('First Number'),
                  hintText: 'First Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  
                ),
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Second Number'),
                  hintText: 'Second Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  )
                ),
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      child: const Text('+',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)),
                  TextButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      child: const Text('-',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)),
                  TextButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      child: const Text('*',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)),
                  TextButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      child: const Text('/',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)),
                ],
              ),
              const SizedBox(height: 32,),
              Text('Result: $_result', style: const TextStyle(
                fontSize: 18
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
