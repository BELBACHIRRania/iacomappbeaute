import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/accueil.dart';
import 'package:iacomappbeaute/views/testt.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {

  int currentIndex = 2;

  final tabs = [
    Accueiltest(),
    Accueiltest(),
    Accueil(),
    Accueil(),
    Accueil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xFFDABCB2),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.near_me,
            ),
            title: Text('Contact',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.blur_on,
              //color: Colors.pink,
            ),
            title: Text(
              'Actualités',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
            ),
            title: new Text('Accueil',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.format_list_bulleted,
            ),
            title: new Text('Services',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.work,
            ),
            title: new Text('Packs',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}