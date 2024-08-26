import 'package:flutter/material.dart';

class Testing extends StatefulWidget{
  const Testing({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TestingState();
  }

}

class _TestingState extends State<Testing>{
  int _counter=0;
  void addCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: Colors.purpleAccent.shade100,
      ),
      body: Center(
        child: Text('Stateful Widget $_counter'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState(() {
                _counter--;
              });
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16,),
          FloatingActionButton(
            onPressed: (){
              addCounter();
            },
            child: const Icon(Icons.add),
          ),

        ],
      )
    );
  }

}