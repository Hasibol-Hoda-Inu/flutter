import 'package:flutter/material.dart';
import 'style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Map <String, double> fromValue={'num1':0, 'num2':0,'num3':0,};
  double sum=0;

  @override
  Widget build(BuildContext context) {

    MyInputOnChange(InputKey, InputValue){
      setState(() {
        fromValue.update(InputKey, (value)=>double.parse(InputValue));
      });
    }

    SumMethod(){
      setState(() {
        sum=fromValue['num1']!+fromValue['num2']!+fromValue['num3']!;
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(sum.toString(), style: HeadingText(),),
                const SizedBox(height: 20,),
                TextFormField(onChanged: (value){
                  MyInputOnChange('num1', value);
                },
                  decoration: AppInputStyle("First Number"),
                ),
                const SizedBox(height: 20,),
                TextFormField(onChanged: (value){
                  MyInputOnChange('num2', value);
                },
                  decoration: AppInputStyle('Second Number'),
                ),
                const SizedBox(height: 20,),
                TextFormField(onChanged: (value){
                  MyInputOnChange('num3', value);
                },
                  decoration: AppInputStyle('Third Number'),
                ),
                const SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  height: 45.0,
                  child: ElevatedButton(onPressed: (){
                    SumMethod();
                    },
                    child: Text('Add'),
                    style: ElevatedButtonStyle(),
                  ),
                )
              ],
            ),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}