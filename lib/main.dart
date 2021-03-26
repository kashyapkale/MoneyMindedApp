import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:moneyminded/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: AnimatedSplashScreen(
        //splash: Image.asset('assets_image/1.jpg'),
        splash: AnimatedText(
          alignment: Alignment.center,
          speed: Duration(milliseconds: 1000),
          controller: AnimatedTextController.loop,
          displayTime: Duration(milliseconds: 1000),
          wordList: ['animations.', 'are.', 'easier.', 'now.'],
          textStyle: TextStyle(
              color: Colors.black, fontSize: 55, fontWeight: FontWeight.w700),
          onAnimate: (index) {
            print("Animating index:" + index.toString());
          },
          onFinished: () {
            print("Animtion finished");
          },
        ),
        nextScreen: Home(),
        backgroundColor: Colors.white,
        duration: 30000,
      ),
    );
  }
}
