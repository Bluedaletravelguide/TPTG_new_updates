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
  // Nature-inspired green color palette
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color accentGreen = Color(0xFF66BB6A);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color lightGreen = Color(0xFFA5D6A7);
  static const Color paleGreen = Color(0xFFE8F5E9);
  static const Color white = Colors.white;

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
    const bodyStyle = TextStyle(
      fontSize: 17,
      color: white,
      height: 1.5,
      fontWeight: FontWeight.w400,
    );

    const titleStyle = TextStyle(
      color: white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    );

    final pageDecorate = PageDecoration(
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      imagePadding: EdgeInsets.only(top: 40, bottom: 20),
      contentMargin: EdgeInsets.symmetric(horizontal: 16),
      pageColor: Colors.transparent,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryGreen,
            darkGreen,
          ],
        ),
      ),
      child: IntroductionScreen(
        key: introkey,
        globalBackgroundColor: Colors.transparent,
        globalHeader: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.nature_people,
                  color: white,
                  size: 28,
                ),
                SizedBox(width: 12),
                Text(
                  'TAIPING THE GUIDE',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        pages: [
          PageViewModel(
            title: 'Welcome to Taiping!',
            body:
            'Discover Malaysia\'s first town with rich heritage and natural beauty. Let\'s take a quick tour.',
            image: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/introduction/1.png',
                    height: 300,
                  ),
                ),
              ),
            ),
            decoration: pageDecorate,
          ),
          PageViewModel(
            title: 'Easy Navigation',
            body:
            'Use the bottom navigation bar to explore different sections. Start from the Home icon to discover Taiping.',
            image: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/introduction/2.png',
                    height: 300,
                  ),
                ),
              ),
            ),
            decoration: pageDecorate,
          ),
          PageViewModel(
            title: 'Save Your Favorites',
            body:
            'Bookmark places you want to visit by tapping the bookmark icon. Access them anytime from your bookmarks.',
            image: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/introduction/3.png',
                    height: 300,
                  ),
                ),
              ),
            ),
            decoration: pageDecorate,
          ),
          PageViewModel(
            title: 'Interactive Content',
            body:
            'Tap on images, buttons, and widgets to explore more details about each attraction and place.',
            image: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/introduction/4.png',
                    height: 300,
                  ),
                ),
              ),
            ),
            decoration: pageDecorate,
          ),
          PageViewModel(
            title: 'Fun Activities',
            body:
            'Challenge yourself with our crossword puzzle and learn more about Taiping\'s heritage!',
            image: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/introduction/5.png',
                    height: 300,
                  ),
                ),
              ),
            ),
            decoration: pageDecorate,
          ),
        ],
        onDone: () => _onEndIntro(),
        onSkip: () => _onEndIntro(),
        showSkipButton: true,
        dotsFlex: 0,
        nextFlex: 0,
        skipOrBackFlex: 0,
        skip: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: white.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          child: Text(
            'SKIP',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        next: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: primaryGreen,
            size: 24,
          ),
        ),
        done: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'GET STARTED',
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.check_circle,
                color: primaryGreen,
                size: 20,
              ),
            ],
          ),
        ),
        curve: Curves.easeInOutCubic,
        controlsMargin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        controlsPadding: EdgeInsets.all(16),
        dotsDecorator: DotsDecorator(
          size: Size(12, 12),
          color: white.withOpacity(0.4),
          activeSize: Size(28, 12),
          activeColor: white,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          shape: CircleBorder(),
          spacing: EdgeInsets.symmetric(horizontal: 6),
        ),
        dotsContainerDecorator: ShapeDecoration(
          color: darkGreen.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}