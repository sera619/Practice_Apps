import 'package:flutter/material.dart';
import 'package:todo_firebase/home/widget/social_btn_bar.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Info',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5,),
          child: Material(
            elevation: 14,
            shadowColor: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: size.height * .6,
              width: size.width * 0.85,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Text(
                    'App Design\n&\nDevelopment\nBy',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontFamily: 'Nocen', fontStyle: FontStyle.italic, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'S3R43o3',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'App Version',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontFamily: 'Nocen', fontStyle: FontStyle.italic, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'v1.2.1',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Need Help?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontFamily: 'Nocen', fontStyle: FontStyle.italic, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You can\ncontact me at',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontStyle: FontStyle.italic, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  SocialBTNBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
