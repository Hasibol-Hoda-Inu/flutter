import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter=0;
  void _onChangeMethod(){
    setState(() {
      _counter++;
    });
  }
  void _onChangeMethodNegative(){
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(' banaichen bhaiya shei hoice: $_counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: (){
                    _onChangeMethodNegative();
                  },
                  child: const Icon(Icons.remove, color: Colors.white,),
                ),
                const SizedBox(width: 16,),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: (){
                    _onChangeMethod();
                  },
                  child: const Icon(Icons.add, color: Colors.white,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
