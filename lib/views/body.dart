import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iacomappbeaute/views/accueil.dart';
import 'package:iacomappbeaute/views/carte.dart';
import 'package:iacomappbeaute/views/testt.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {

  int currentIndex = 0;

  final tabs = [
    Accueil(),
    Carte(),
    Accueil(),
    Accueiltest(),
    Accueiltest(),
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
              Icons.home,
            ),
            title: Text('Accueil',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bookOpen,
            ),
            title: Text(
              'Carte',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.stars,
            ),
            title: new Text('Prestation',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.bookmark,
            ),
            title: new Text('Reservation',
                style: TextStyle(
                  fontSize: 10,
                )),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.near_me,
            ),
            title: new Text('Contact',
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