import 'package:flutter/material.dart';

class NavbarDeskTopWidget extends StatelessWidget {
  const NavbarDeskTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HUMMING\nBIRD.', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
        Row(
          children: [
            Text('Episodes'),
            SizedBox(width: 24,),
            Text('About'),
          ],
        ),
      ],
    );
  }
}