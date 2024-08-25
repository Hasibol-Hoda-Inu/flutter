import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQuery=MediaQuery.of(context);

    print(mediaQuery.size.width);
    print(mediaQuery.size.flipped);
    print(mediaQuery.size.height);
    print(mediaQuery.size.aspectRatio);
    print(mediaQuery.size.flipped.width);

    if(mediaQuery.size.width<640){
      print('This is a small device such as mobile');
    }else if(mediaQuery.size.width > 641 && mediaQuery.size.width < 1007){
      print('This is a medium device such as tablet');
    }else{
      print('this is a large devices such as desktop or a laptop');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      // body: OrientationBuilder(
      //   builder: (context, Orientation orientation) {
      //     if(orientation==Orientation.portrait){
      //       return Column(
      //         children: [
      //           Wrap(
      //             spacing: 12,
      //             children: [
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text('data'),
      //               Text(orientation.name),
      //             ],
      //           ),
      //         ],
      //       );
      //     }else{
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('This is Landscap')
      //           ],
      //         ),
      //       );
      //     }
      //   }
      // ),
      // body: LayoutBuilder(
      //   builder:(context, BoxConstraints constraints){
      //     if(constraints.maxWidth<640){
      //      return const Center(
      //        child: Text('This is a small device such as mobile'),
      //      );
      //     }else if(constraints.maxWidth > 641 && constraints.maxWidth < 1007){
      //      return const Text('This is a medium device such as tablet');
      //     }else{
      //      return const Text('this is a large devices such as desktop or a laptop');
      //     }
      //   },
      // ),

      body: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Container(
            color: Colors.yellow,
            child: Center(
              child: AspectRatio(
                aspectRatio: 4/3,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),

      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   color: Colors.yellow,
      //   child: FractionallySizedBox(
      //     widthFactor: 0.5,
      //     heightFactor: 0.5,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.green,
      //         borderRadius: BorderRadius.circular(40),
      //       ),
      //     ),
      //   ),
      // ),

    );
  }
}
