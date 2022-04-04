import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/actualite_list.dart';
import 'package:iacomappbeaute/views/body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('es', ''),
      ],
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

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token1;
  int currentIndex = 0;

  savePref(int currentIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("currentIndex", currentIndex);
      preferences.commit();
    });
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.getToken().then((token) {
      print("Token is " + token);
      setState(() {
        token1 = token;
      });
    });
  }

  subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  @override
  void initState() {
    super.initState();
    startTime();
    //
    savePref(currentIndex);
    subscribeToTopic('beauty');
    _firebaseMessaging.configure(
      onResume: (Map<String, dynamic> message) {
        print("I am hereonResume");
        print(message);
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ActualiteScreen())
        );
      },
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('${message['notification']['title']}'),
                content: Text(
                    '${message['notification']['body']}'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );
    firebaseCloudMessaging_Listeners();
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
    //
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
