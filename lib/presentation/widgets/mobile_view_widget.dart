import 'package:flutter/material.dart';

import 'body_of_tablet_widget.dart';

class MobileView extends StatelessWidget {
  const MobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Text('HUMMING\nBIRD.', style: TextStyle(
                  fontWeight: FontWeight.w600
              ),),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xff1FE492),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('SKILL UP NOW', style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                            TextButton(
                                onPressed: (){},
                                child: const Text('Tap here', style: TextStyle(
                                    color: Colors.white
                                ),)
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){},
                              icon: const Icon(Icons.play_arrow_rounded, color: Colors.white,))
                        ],
                      )
                    ],
                  )
              ),
              const ListTile(
                leading: Icon(Icons.ondemand_video_rounded),
                title: Text('Episodes'),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('About'),
              ),
            ],
          ),
        ),
        body: const Center(
          child: BodyOfTablet(buttonWidth: 300,),
        )
    );
  }
}