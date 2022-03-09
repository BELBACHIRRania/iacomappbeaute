import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  int currentIndex = 0;

  savePref(int currentIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("currentIndex", currentIndex);
      preferences.commit();
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
    savePref(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 1);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Body()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFDABCB2),
        child: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 80,
          ),
        ),
      ),
    );
  }
}
