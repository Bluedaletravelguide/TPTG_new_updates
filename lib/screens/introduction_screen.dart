import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../screens/tabs_screen.dart';

class Introduction extends StatefulWidget {
  @override
  IntroductionState createState() => IntroductionState();
}

class IntroductionState extends State<Introduction> {
  final introkey = GlobalKey<IntroductionScreenState>();

  void _onEndIntro() {
    Navigator.of(context).pushReplacement(
      platformPageRoute(
        context: context,
        builder: (context) => new TabsScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    const bodystyle = TextStyle(fontSize: 16, color: Colors.white);
    const pageDecorate = PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: bodystyle,
        //descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        imagePadding: EdgeInsets.only(top: 25));

    return IntroductionScreen(
      key: introkey,
      globalBackgroundColor: Colors.blue,
      globalHeader: SizedBox(
        height: 25,
        child: Container(
          color: Colors.blue,
        ),
      ),
      pages: [
        PageViewModel(
            title: 'Welcome!',
            body: 'First time using this app? Let\'s take a tour.',
            image: Center(
              child: Image.asset('assets/images/introduction/1.png'),
            ),
            decoration: pageDecorate),
        PageViewModel(
            title: 'Home Screen',
            body:
                'The three bottom navigator icon is important, especially the \'Home\' icon',
            image: Center(
              child: Image.asset('assets/images/introduction/2.png'),
            ),
            decoration: pageDecorate),
        PageViewModel(
            title: 'Content List Screen',
            body: 'Bookmark the places you wanna go at the left for each item',
            image: Center(
              child: Image.asset('assets/images/introduction/3.png'),
            ),
            decoration: pageDecorate),
        PageViewModel(
            title: 'Content Screen',
            body:
                'The arrow pointing to each widget can be interactable via touching on it.',
            image: Center(
              child: Image.asset('assets/images/introduction/4.png'),
            ),
            decoration: pageDecorate),
        PageViewModel(
            title: 'Crossword',
            body: 'Have a go with our crossword puzzle.',
            image: Center(
              child: Image.asset('assets/images/introduction/5.png'),
            ),
            decoration: pageDecorate),
      ],
      onDone: () => _onEndIntro(),
      onSkip: () => _onEndIntro(),
      showSkipButton: true,
      dotsFlex: 0,
      nextFlex: 0,
      skip: const Text('SKIP'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('DONE'),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
