import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'ui/home.dart';
import 'config/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 252, 69, 104)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: SizedBox(
            height: 200,
            child: Image.asset(
              "IMAGE/logo.gif",
              fit: BoxFit.contain,
            )),
        nextScreen: WeeklyPackage(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class WeeklyPackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nibin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: AppColors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
