import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/presentation/widgets/responsive_builder.dart';

import '../widgets/drawer_menu.dart';
import '../widgets/video_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: Scaffold(
          appBar: AppBar(
            title: const Text('Home screen'),
            actions: [
              const Icon(Icons.cast),
              IconButton(onPressed: (){},
                  icon: const Badge(
                    label: Text('8'),
                    textColor: Colors.white,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.notifications_none_rounded),
                  )
              ),
              const Icon(Icons.search),
            ],
          ),
          drawer: const DrawerMenuWidget(),
          body: const Column(
            children: [
              VideoContainer(crossAxisCount: 1)
            ],
          )
      ),
      tablet: Scaffold(
          appBar: AppBar(
            title: const Text('Home screen'),
            actions: [
              const Icon(Icons.cast),
              IconButton(onPressed: (){},
                  icon: const Badge(
                    label: Text('8'),
                    textColor: Colors.white,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.notifications_none_rounded),
                  )
              ),
              const Icon(Icons.search),
            ],
          ),
          drawer: const DrawerMenuWidget(),
          body: const Column(
            children: [
              VideoContainer(crossAxisCount: 2)
            ],
          )
      ),
      desktop: Scaffold(
          appBar: AppBar(
            title: const Row(
              children: [
                Text('YouTube'),
                Icon(Icons.mic)
              ],
            ),
            actions: [
              const Icon(Icons.video_call_outlined),
              IconButton(onPressed: (){},
                  icon: const Badge(
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    label: Text('8'),
                    child: Icon(Icons.notifications_none_rounded),
                  )
              ),
              const CircleAvatar(),
            ],
          ),
          body: const Row(
            children: [
              DrawerMenuWidget(),
              VideoContainer(crossAxisCount: 3,)
        ],
      )),
    );
  }

}

class VideoContainer extends StatelessWidget {
  const VideoContainer({
    super.key,
    required this.crossAxisCount,
  });
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
          itemCount: 30,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: crossAxisCount,
           childAspectRatio: 4/3,
           mainAxisSpacing: 16.0,
           crossAxisSpacing: 16.0,
         ), itemBuilder: (BuildContext context, int index) {
           return const VideoCardWidget();
        },
        ));
  }
}


