import 'package:flutter/material.dart';
import 'style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isDarkMode=false;

  void toggleTheme(){
    setState(() {
      isDarkMode=!isDarkMode;
    });
  }

  List toDoList=[];
  String item='';
  TextEditingController textController=TextEditingController();

  myInputOnChange (content){
    setState(() {
      item=content;
    });
  }

  // onFireAddItem(){
  //   setState(() {
  //     toDoList.add({'item': item});
  //     textController.text.trim().isNotEmpty;
  //     textController.clear();
  //   });
  // }

  onFireAddItem(){
    setState(() {
      if(item.trim().isNotEmpty && !toDoList.any((element) => element['item'] == item)){
        toDoList.add({'item':item});
        textController.clear();
      }
    });
  }



  toDoRomoveFunction(index){
    setState(() {
      toDoList.removeAt(index);
      MySnackBar('Successfully Deleted', context);
    });
  }

  MySnackBar(massege, context){
    return ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(massege)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,

        leading: DrawerButton(onPressed: (){},),
        actions: [
          IconButton(onPressed: (){toggleTheme();},
            icon: const Icon(Icons.light_mode)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                      flex:80,
                      child: TextFormField(
                        onChanged: (content){myInputOnChange(content);},
                        controller: textController,
                        decoration: inputFormStyle('Your task'),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      flex: 20,
                      child: ElevatedButton(onPressed: (){
                        onFireAddItem();
                      },
                        child: Text('Add'),
                        style: elevatedButtonStyle(),
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: sizebox50(
                        Row(
                          children: [
                            Expanded(
                              flex: 90,
                              child: Text(toDoList[index]['item'].toString(),
                                style: const TextStyle(fontSize: 16),),
                            ),
                            Expanded(
                              flex: 10,
                                child: IconButton.filledTonal(
                                  iconSize:18,
                                  // color: Colors.black54,
                                  icon: const Icon(Icons.delete),
                                  onPressed:(){
                                    toDoRomoveFunction(index);
                                  },
                                ),
                                // child: TextButton(onPressed: (){},child: Icon(Icons.delete),),

                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: toggleTheme,
        tooltip: 'toggle theme',
        child: const Icon(Icons.lightbulb),
    ),
    );
  }
}