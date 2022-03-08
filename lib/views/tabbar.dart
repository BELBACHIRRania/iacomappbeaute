import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/accueil.dart';

class tabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 20,
      currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        if (value == 0)
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Contact()),
          // );
        if (value == 1)
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ActualiteScreen()),
          // );
        if (value == 2)
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Accueil()),
          // );
        if (value == 3)
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ServiceScreen()),
          // );
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
            color: Colors.pink,
          ),
          title: Text('Contact',
              style: TextStyle(
                fontSize: 10,
                color: Colors.pink,
              )),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.blur_on,
            color: Colors.pink,
          ),
          // ignore: deprecated_member_use
          title: Text(
            'Actualités',
            style: TextStyle(
              fontSize: 10,
              color: Colors.pink,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.home,
            color: Colors.pink,
          ),
          // ignore: deprecated_member_use
          title: new Text('Accueil',
              style: TextStyle(
                fontSize: 10,
                color: Colors.pink,
              )),
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.format_list_bulleted,
            color: Colors.pink,
          ),
          // ignore: deprecated_member_use
          title: new Text('Services',
              style: TextStyle(
                fontSize: 10,
                color: Colors.pink,
              )),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.work, color: Colors.pink),
          // ignore: deprecated_member_use
          title: new Text('Packs',
              style: TextStyle(fontSize: 10, color: Colors.pink)),
        ),
      ],
    );
  }
}