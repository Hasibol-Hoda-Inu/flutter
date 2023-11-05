import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'DynamicListViewBuilder'),
    );
  }
}





class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var MyItems=[
    {"img":"https://designmingle.com/wp-content/uploads/2023/08/4-01-scaled-1.png", "title":"Enu"},
    {"img":"https://designmingle.com/wp-content/uploads/2023/08/7-01-scaled-1.png", 'title':'Rupam Murgi'},
    {"img":"https://designmingle.com/wp-content/uploads/2023/08/6-01-scaled-1.png", "title":"Jennifar lowrence"},
    {'img':'https://designmingle.com/wp-content/uploads/2023/08/1-v2-01-scaled-1.png', 'title':'Ahmed Saif'},
    {'img':'https://designmingle.com/wp-content/uploads/2023/08/3-01-scaled-1.png', 'title':'Al-Nur Kishan'},
    {'img':'https://designmingle.com/wp-content/uploads/2023/10/Identify-the-signs-1024x682.webp', 'title':'Cn Parthoo'},
  ];

  MySncakBar(context, msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: ListView.builder(
               itemCount: MyItems.length,
               itemBuilder: (context, index){
                 return GestureDetector(
                   onLongPress: (){
                     MySncakBar(context, MyItems[index]['title']);
                   },
                   child: Container(
                     margin: EdgeInsets.all(10),
                     width: double.infinity,
                     height: 270,
                     child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill),
                   ),
                 );
            },
           ),
    );
  }
}
