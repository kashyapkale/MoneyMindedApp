import 'package:flutter/material.dart';
import 'package:moneyminded/views/home.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new Home(),
        backgroundColor: Colors.black,
        title: new Text(
          '   MoneyMinded',
          textScaleFactor: 2,
          style: TextStyle(color: Colors.white),
        ),
        image: new Image.asset('lib/assets_image/1.png'),
        loadingText: Text(
          "Welcome",
          style: TextStyle(color: Colors.white),
        ),
        photoSize: 100.0,
        loaderColor: Colors.blue,
      ),
      /*splash: AnimatedText(
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
        ),*/
    );
  }
}
