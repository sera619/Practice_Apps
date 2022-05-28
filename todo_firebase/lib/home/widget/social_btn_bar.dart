import 'package:flutter/material.dart';
import 'package:todo_firebase/home/widget/social_btn.dart';


class SocialBTNBar extends StatefulWidget {
  const SocialBTNBar({Key? key}) : super(key: key);

  @override
  State<SocialBTNBar> createState() => _SocialBTNBarState();
}

class _SocialBTNBarState extends State<SocialBTNBar> {
  @override
  Widget build(BuildContext context) {
    const String youtubeUrl = 'https://www.youtube.com/channel/UCJLXwZV5Kk4XRF6TSY_iPgQ';
    const String homepageUrl = 'https://www.hackzor.de';
    return Center(
      child: Container(
        height: 50,
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialBTN(
              icon: Icon(Icons.home_filled),
              url: homepageUrl,
            ),
            SizedBox(
              width: 10,
            ),
            SocialBTN(icon: Icon(Icons.play_circle_fill_outlined), url: youtubeUrl),
          ],
        ),
      ),
    );
  }
}
