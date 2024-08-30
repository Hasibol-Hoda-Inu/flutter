import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumTEController=TextEditingController();
  final TextEditingController _secondNumTEController=TextEditingController();
  double _result = 0;
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
                controller: _firstNumTEController,
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
                controller: _secondNumTEController,
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
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: (){
                        _onTabAddButton();
                      },
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
                      onPressed: _onTabRemoveButton,
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
                      onPressed: _onTabMultiplyButton,
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
                      onPressed: _onTabDivisionButton,
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
              Text('Result: ${_result.toStringAsFixed(2)}', style: const TextStyle(
                fontSize: 18
              ),)
            ],
          ),
        ),
      ),
    );
  }
  void _onTabAddButton(){
    double firstNum=double.parse(_firstNumTEController.text)??0;
    double secondNum=double.parse(_secondNumTEController.text)??0;
    setState(() {
      _result = firstNum+secondNum;
    });
  }
  void _onTabRemoveButton(){
    double firstNum=double.parse(_firstNumTEController.text)??0;
    double secondNum=double.parse(_secondNumTEController.text)??0;
    setState(() {
      _result = firstNum-secondNum;
    });
  }
  void _onTabMultiplyButton(){
    double firstNum=double.parse(_firstNumTEController.text)??0;
    double secondNum=double.parse(_secondNumTEController.text)??0;
    setState(() {
      _result = firstNum*secondNum;
    });
  }
  void _onTabDivisionButton(){
    double firstNum=double.parse(_firstNumTEController.text)??0;
    double secondNum=double.parse(_secondNumTEController.text)??0;
    setState(() {
      _result = firstNum/secondNum;
    });
  }

  @override
  void dispose() {
    _firstNumTEController.dispose();
    _secondNumTEController.dispose();
    super.dispose();
  }
}
