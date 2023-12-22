import 'package:flutter/material.dart';
import 'restClient.dart';
import 'style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {

  Map <String, String> FormValues={'img':'','productCode':'','productName':'','qty':'','unitPrice':'', 'totalPrice':'',};

  // loading
  bool loading=false;

  InputOnChange(key,textValue){
    setState(() {
      FormValues.update(key, (value) => textValue);
    });
  }

  formOnSubmision() async {
    if(FormValues['productName']!.isEmpty){
      errorToast('Please input product name');
    }
    else if (FormValues['productCode']!.isEmpty){
      errorToast('Please input product code');
    }
    else if (FormValues['unitPrice']!.isEmpty){
      errorToast('Please input unit price');
    }
    else if (FormValues['totalPrice']!.isEmpty){
      errorToast('Please input total price');
    }
    else if (FormValues['qty']!.isEmpty){
      errorToast('Please input qty');
    }
    else if (FormValues['img']!.isEmpty){
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
            child: loading?(Center(child:CircularProgressIndicator())):(SingleChildScrollView(
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
                        DropdownMenuItem(child: Text('5 pcs'), value: '5',),
                        DropdownMenuItem(child: Text('6 pcs'), value: '6',),
                        DropdownMenuItem(child: Text('7 pcs'), value: '7',),
                      ],
                      onChanged: (textValue){
                        InputOnChange('qty', textValue);
                      },
                      isExpanded:true,
                      underline: Container(),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(onChanged: (textValue){
                    InputOnChange('img', textValue);
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
