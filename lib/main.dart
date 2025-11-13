//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'Data/SizeConfig.dart';
import 'screens/introduction_screen.dart';
import 'screens/tabs_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
//import 'models/notification.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt('initScreen', 1);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/splashTPTG.png',
        ),
        splashIconSize: 175,
        nextScreen: Loading(),
        splashTransition: SplashTransition.decoratedBoxTransition,
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // PushNotificationsManager().init();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taiping The Guide',
        theme: ThemeData(
            canvasColor: Color.fromRGBO(255, 255, 255, 1),
            appBarTheme:
            AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
            textTheme: ThemeData.light().textTheme.copyWith(
              //Black
              //Fees
              //Location
              //Tel
              //WorkHour
              //Ebook
              //About Us
              displayLarge: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  fontFamily: 'RobotoCondensed-Bold',
                  fontWeight: FontWeight.w700,
                  color: Colors.black),

              //White
              //Descreption (content)
              //medical_screen ()
              displayMedium: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed-Light',
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
              ),

              displaySmall: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed-Light',
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.safeBlockHorizontal * 4,
              ),
              //Black
              //about_us (content)
              //content_screen (content)
              //medical_screen ()
              bodyLarge: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.white,
                fontFamily: 'RobotoCondensed-Regular',
              ),
              bodyMedium: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.black,
                // fontFamily: 'RobotoCondensed-Regular',
              ),
              headlineMedium: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.black,
                // fontFamily: 'RobotoCondensed-Regular',
              ),

              //White
              //Contact Us (Text Field)
              titleMedium: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                  fontFamily: 'RobotoCondensed-Light',
                  fontWeight: FontWeight.w300,
                  color: Colors.black),

              //Black
              //categories (Descreption)
              //sub_categories (Descreption)
              titleSmall: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontFamily: 'Raleway-Bold',
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.safeBlockHorizontal * 4,
              ),

              //White
              //categories (Title)
              //sub_categories (Title)
              headlineSmall: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontFamily: 'RobotoCondensed-Regular',
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              titleLarge: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  fontFamily: 'RobotoCondensed-Light',
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: Colors.deepPurple[700])),
        initialRoute:
        initScreen == 0 || initScreen == null ? 'introduction' : '/',
        routes: {
          '/': (ctx) => TabsScreen(),
          'introduction': (ctx) => Introduction()
        });
  }
}
