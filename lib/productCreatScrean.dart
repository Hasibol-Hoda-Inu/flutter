import 'package:flutter/material.dart';
import 'style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map <String, String> FormValues={'img':'','productCode':'','productName':'','qty':'','unitPrice':'', 'totalPrice':'',};

  InputOnChange(key,textValue){
    setState(() {
        FormValues.update(key, (value) => textValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create your product'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(onChanged: (textValue){
                    InputOnChange('productName', textValue);
                  },
                  decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(height: 20,),
                  
                  TextFormField(onChanged: (textValue){
                    InputOnChange('productCode', textValue);
                  },
                  decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
                    InputOnChange('img', textValue);
                  },
                  decoration: AppInputDecoration('Product img url'),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
                    InputOnChange('unitPrice', textValue);
                  },
                  decoration: AppInputDecoration("Unit Price"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
                    InputOnChange('totalPrice', textValue);
                  },
                  decoration: AppInputDecoration('Total Price'),
                  ),

                  SizedBox(height: 20,),

                  DropDownMenuStyle(
                    DropdownButton(
                      value:FormValues['qty'],
                      items: [
                        DropdownMenuItem(child: Text('Product qty'), value:'',),
                        DropdownMenuItem(child: Text('1 pcs'), value:'1',),
                        DropdownMenuItem(child: Text('2 pcs'), value: '2',),
                        DropdownMenuItem(child: Text('3 pcs'), value: '3',),
                        DropdownMenuItem(child: Text('4 pcs'), value: '4',),
                      ],
                      onChanged: (textValue){
                        InputOnChange('qty', textValue);
                      },
                      isExpanded:true,
                      underline: Container(),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      child: ElevatedButton(onPressed: (){},
                      child: const Text('Submit'),
                        style: AppButtonDefalultStyle(),
                      ),
                    width: double.infinity,
                    height: 45,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
