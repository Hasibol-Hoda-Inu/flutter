import 'package:crud_app_with_rest_api/ProductCreateScreen.dart';
import 'package:crud_app_with_rest_api/productUpdateScreen.dart';
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

  deleteItem(id){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Do you want to delete?'),
            content: const Text("Once delete you couldn't be able to get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {
                  loading= true;
                });
               await deleteProduct(id);
               callingData();
              }, child: const Text('Yes')),

              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('No'))
            ],
      );
      }
    );
  }

  gotoUpdatePage(){
    Navigator.push(context, MaterialPageRoute(builder: (builder)=>productUpdateScreen()));
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
            child: loading?(Center(child: CircularProgressIndicator(),)):
            RefreshIndicator(
                child: GridView.builder(
                gridDelegate: productScreenGridView(),
              itemCount: ProductList.length,
              itemBuilder: (context, index){
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image.network(ProductList[index]['Img'])),
                      Container(
                        padding: const EdgeInsets.fromLTRB(12.0,6,12,6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ProductList[index]['ProductName'],
                              style: TextStyle(fontSize: 16),),
                            SizedBox(height: 6,),
                            Text('Price:'+ProductList[index]['UnitPrice']+'BDT'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton.filledTonal(onPressed: (){
                                  gotoUpdatePage();
                                },
                                  icon: const Icon(Icons.edit),),
                                const SizedBox(width: 5,),
                                IconButton.filledTonal(onPressed: (){
                                  deleteItem(ProductList[index]['_id']);
                                },
                                  icon: const Icon(Icons.delete_outline),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
          ),
                onRefresh: () async {
                 await callingData();
            }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ProductCreateScreen()));
        },
        child: const Icon(Icons.add),
      )
    );
  }
}
