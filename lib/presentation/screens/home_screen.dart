import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumTEController=TextEditingController();
  final TextEditingController _secondNumTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _firstNumTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('First Number'),
                    hintText: 'First Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),

                  ),
                  validator: (String? value){
                    if(value==null || value.isEmpty){
                      return 'Enter a value';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _secondNumTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Second Number'),
                    hintText: 'Second Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                    )
                  ),
                  validator: (String?value){
                    if(value==null || value.isEmpty){
                      return 'Enter a value';
                    }return null;
                  },
                ),
                const SizedBox(height: 24,),
                _buildButtonBar(),
                const SizedBox(height: 32,),
                Text('Result: ${_result.toStringAsFixed(2)}', style: const TextStyle(
                  fontSize: 18
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
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
              );
  }
  void _onTabAddButton(){
   if(_formKey.currentState!.validate()){
     double firstNum=double.tryParse(_firstNumTEController.text)??0;
     double secondNum=double.tryParse(_secondNumTEController.text)??0;
     _firstNumTEController.clear();
     _secondNumTEController.clear();
     setState(() {
       _result = firstNum+secondNum;
     });
   }
  }
  void _onTabRemoveButton(){
    if(_formKey.currentState!.validate()){
      double firstNum=double.tryParse(_firstNumTEController.text)??0;
      double secondNum=double.tryParse(_secondNumTEController.text)??0;
      _firstNumTEController.clear();
      _secondNumTEController.clear();
      setState(() {
        _result = firstNum-secondNum;
      });
    }
  }
  void _onTabMultiplyButton(){
    if(_formKey.currentState!.validate()){
      double firstNum=double.tryParse(_firstNumTEController.text)??0;
      double secondNum=double.tryParse(_secondNumTEController.text)??0;
      _firstNumTEController.clear();
      _secondNumTEController.clear();
      setState(() {
        _result = firstNum*secondNum;
      });
    }
  }
  void _onTabDivisionButton(){
    if(_formKey.currentState!.validate()){
      double firstNum=double.tryParse(_firstNumTEController.text)??0;
      double secondNum=double.tryParse(_secondNumTEController.text)??0;
      _firstNumTEController.clear();
      _secondNumTEController.clear();
      setState(() {
        _result = firstNum/secondNum;
      });
    }
  }
  // bool _validateTextField(){
  //   if(_firstNumTEController.text.isEmpty){
  //     return false;
  //   }
  //   if(_secondNumTEController.text.isEmpty){
  //     return false;
  //   }return true;
  // }

  @override
  void dispose() {
    _firstNumTEController.dispose();
    _secondNumTEController.dispose();
    super.dispose();
  }
}
