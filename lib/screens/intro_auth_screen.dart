import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:video_meet_app/variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Welcome",
            body: "Welcome to Video Meet , the best video conference app",
            image: Center(
              child: Image.asset(
                'assets/images/welcome.png',
                height: 175,
              ),
            ),
            decoration: PageDecoration(
                bodyTextStyle: myStyle(20, Colors.black),
                titleTextStyle: myStyle(20, Colors.black))),
        PageViewModel(
            title: "High Security",
            body: "Conference with high security",
            image: Center(
              child: Image.asset(
                'assets/images/secure.jpg',
                height: 175,
              ),
            ),
            decoration: PageDecoration(
                bodyTextStyle: myStyle(20, Colors.black),
                titleTextStyle: myStyle(20, Colors.black))),
        PageViewModel(
            title: "Join or Start Meeting",
            body: "Join or Start your meeting now with free of cost",
            image: Center(
              child: Image.asset(
                'assets/images/conference.png',
                height: 175,
              ),
            ),
            decoration: PageDecoration(
                bodyTextStyle: myStyle(20, Colors.black),
                titleTextStyle: myStyle(20, Colors.black))),
      ],
      onDone: () {
        print("Done");
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(
        Icons.skip_next,
        size: 45,
      ),
      next: const Icon(Icons.arrow_forward),
      done: Text(
        "Done",
        style: myStyle(20, Colors.black),
      ),
    );
  }
}
