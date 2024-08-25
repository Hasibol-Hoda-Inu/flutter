import 'package:flutter/material.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/hq720.webp',
              repeat: ImageRepeat.noRepeat,
            )),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Expanded(
                child: Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ShrinkWrap vs Slivers | Decoding Flutter'),
                    Text('Flutter - 1.2 lakh vies - 2 years ago'),
                  ],
                ),
              ],
            )),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
          ],
        )
      ],
    );
  }
}
