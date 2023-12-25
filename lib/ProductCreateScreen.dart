import 'package:flutter/material.dart';
import 'restClient.dart';
import 'style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map <String, String> FormValues={'Img':'','ProductName':'','ProductCode':'','Qty':'','UnitPrice':'', 'TotalPrice':'',};

  // loading
  bool loading=false;

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
      await createProduct(FormValues);
      setState(() {
        loading = false;
      });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your product'),
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
                  TextFormField(onChanged: (textValue){
                    InputOnChange('ProductName', textValue);
                  },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(onChanged: (textValue){
                    InputOnChange('ProductCode', textValue);
                  },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
                    InputOnChange('UnitPrice', textValue);
                  },
                    decoration: AppInputDecoration("Unit Price"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
                    InputOnChange('TotalPrice', textValue);
                  },
                    decoration: AppInputDecoration('Total Price'),
                  ),

                  const SizedBox(height: 20,),

                  DropDownMenuStyle(
                    DropdownButton(
                      value:FormValues['Qty'],
                      items: [
                        DropdownMenuItem(child: Text('Product qty'), value:''),
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
                      underline: Container(),
                      isExpanded:true,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
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
