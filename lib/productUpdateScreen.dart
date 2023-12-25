import 'package:crud_app_with_rest_api/ProductScreen.dart';
import 'package:flutter/material.dart';
import 'restClient.dart';
import 'style.dart';

class productUpdateScreen extends StatefulWidget {
  final Map updateItem;
  const productUpdateScreen(this.updateItem);

  @override
  State<productUpdateScreen> createState() => _productUpdateScreenState();
}

class _productUpdateScreenState extends State<productUpdateScreen> {


  Map <String, String> FormValues={'Img':'','ProductName':'','ProductCode':'','Qty':'','UnitPrice':'', 'TotalPrice':'',};

  // loading
  bool loading=false;

  @override
  void initState(){
    setState(() {
      FormValues.update('ProductName', (value) => widget.updateItem['ProductName']);
      FormValues.update('ProductCode', (value) => widget.updateItem['ProductCode']);
      FormValues.update('UnitPrice', (value) => widget.updateItem['UnitPrice']);
      FormValues.update('TotalPrice', (value) => widget.updateItem['TotalPrice']);
      FormValues.update('Qty', (value) => widget.updateItem['Qty']);
      FormValues.update('Img', (value) => widget.updateItem['Img']);
    });
  }

  InputOnChange(key,textValue){
    setState(() {
      FormValues.update(key, (value) => textValue);
    });
  }

  formOnSubmision() async {
    if(FormValues['ProductName']!.isEmpty){
      errorToast('Please input product name');
    }
    else if (FormValues['ProductCode']!.isEmpty){
      errorToast('Please input product code');
    }
    else if (FormValues['UnitPrice']!.isEmpty){
      errorToast('Please input unit price');
    }
    else if (FormValues['TotalPrice']!.isEmpty){
      errorToast('Please input total price');
    }
    else if (FormValues['Qty']!.isEmpty){
      errorToast('Please input qty');
    }
    else if (FormValues['Img']!.isEmpty){
      errorToast('Please input img url');
    }
    else {
      setState(() {
        loading =true;
      });
      await updateProduct(FormValues, widget.updateItem['_id']);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductScreen()), (Route route)=>false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update product'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: loading?(const Center(child:CircularProgressIndicator())):(SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue:FormValues['ProductName'],
                      onChanged: (textValue){
                      InputOnChange('ProductName', textValue);
                    },
                      decoration: AppInputDecoration('Product Name'),
                    ),
                    const SizedBox(height: 20,),

                    TextFormField(
                      initialValue: FormValues['ProductCode'],
                      onChanged: (textValue){
                      InputOnChange('ProductCode', textValue);
                    },
                      decoration: AppInputDecoration('Product Code'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      initialValue: FormValues['UnitPrice'],
                      onChanged: (textValue){
                      InputOnChange('UnitPrice', textValue);
                    },
                      decoration: AppInputDecoration("Unit Price"),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      initialValue: FormValues['TotalPrice'],
                      onChanged: (textValue){
                      InputOnChange('TotalPrice', textValue);
                    },
                      decoration: AppInputDecoration('Total Price'),
                    ),

                    const SizedBox(height: 20,),

                    DropDownMenuStyle(
                      DropdownButton(
                        value:FormValues['Qty'],
                        items: [
                          DropdownMenuItem(child: Text('Product qty'), value: '',),
                          DropdownMenuItem(child: Text('1 Pice'), value:'1 Pice',),
                          DropdownMenuItem(child: Text('2 Pice'), value: '2 Pice',),
                          DropdownMenuItem(child: Text('3 Pice'), value: '3 Pice',),
                          DropdownMenuItem(child: Text('4 Pice'), value: '4 Pice',),
                          DropdownMenuItem(child: Text('5 Pice'), value: '5 Pice',),
                          DropdownMenuItem(child: Text('6 Pice'), value: '6 Pice',),
                          DropdownMenuItem(child: Text('7 Pice'), value: '7 Pice',),
                        ],
                        onChanged: (textValue){
                          InputOnChange('Qty', textValue);
                        },
                        isExpanded:true,
                        underline: Container(),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      initialValue: FormValues['Img'],
                      onChanged: (textValue){
                      InputOnChange('Img', textValue);
                    },
                      decoration: AppInputDecoration('Product img url'),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      child: ElevatedButton(onPressed: (){
                        formOnSubmision();
                      },
                        child: const Text('Submit'),
                        style: AppButtonDefalultStyle(),
                      ),
                      width: double.infinity,
                      height: 45,
                    )
                  ],
                ),
              ))
          )
        ],
      ),
    );
  }
}
