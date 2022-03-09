import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/accueil.dart';
import 'package:iacomappbeaute/views/testt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return tabBarState();
  }
}

class tabBarState extends State<tabBar> {

  int value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.reload();
      value = preferences.getInt("currentindex");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black,
      selectedItemColor: Color(0xFFDABCB2),
      iconSize: 20,
      currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        if (value == 0)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueiltest()),
          );
        if (value == 1)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueil()),
          );
        if (value == 2)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueil()),
          );
        if (value == 3)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueil()),
          );
        if (value == 4)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueil()),
          );
      },
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
    );
  }
}