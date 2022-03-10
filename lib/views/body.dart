import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iacomappbeaute/views/accueil.dart';
import 'package:iacomappbeaute/views/carte.dart';
import 'package:iacomappbeaute/views/contact.dart';
import 'package:iacomappbeaute/views/prestation_list.dart';
import 'package:iacomappbeaute/views/reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {

  int currentIndex = 0;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.reload();
      currentIndex = preferences.getInt("currentIndex");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  final tabs = [
    Accueil(),
    Carte(),
    PrestationList(),
    Reservation(),
    Contact(),
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