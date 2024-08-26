import 'package:flutter/material.dart';

import '../widgets/body_desktop_widget.dart';
import '../widgets/body_of_tablet_widget.dart';
import '../widgets/mobile_view_widget.dart';
import '../widgets/navbar_desktop_widget.dart';
import '../widgets/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
        mobile: MobileView(),
        tablet: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                NavbarDeskTopWidget(),
                BodyOfTablet(buttonWidth: 200,),
              ],
            ),
          ),
        ),
        desktop: Scaffold(
          body: Center(
            child: SizedBox(
              width: 1400,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    NavbarDeskTopWidget(),
                    BodyDesktop(),
                  ],
                ),
              ),
            ),
          )
        )
    );
  }
}






