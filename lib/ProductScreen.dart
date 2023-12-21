import 'package:crud_app_with_rest_api/restClient.dart';
import 'package:crud_app_with_rest_api/style.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
class _ProductScreenState extends State<ProductScreen> {

  List ProductList=[];
  bool loading= true;

  @override
  void initState(){
    callingData();
    super.initState();
  }

  Future<void> callingData() async {
    loading= true;
    var data= await getProductInfo();
    setState(() {
      ProductList=data;
      loading= false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: loading?(Center(child: CircularProgressIndicator(),)):(
            GridView.builder(
                gridDelegate: productScreenGridView(),
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: Image.network(ProductList[index]['Img'])),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(ProductList[index]['ProductName'],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 0,0,0),
                          child: Text(ProductList[index]['ProductCode'],),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0,0,12.0),
                          child: Text(ProductList[index]['TotalPrice']),
                        ),
                      ],
                    ),
                  );
                }
            )
            ),
          )
        ],
      ),
    );
  }
}
