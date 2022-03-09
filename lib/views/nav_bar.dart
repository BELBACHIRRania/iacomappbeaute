import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iacomappbeaute/views/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavBarState();
  }
}

class NavBarState extends State<NavBar> {
  int currentIndex = 0;

  savePref(int currentIndex) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("currentIndex", currentIndex);
      preferences.commit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            color: Color(0xFFDABCB2),
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bookmark, color: Colors.black87),
            title: Text(
              'Mon espace',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "QueenSemiBold",
              ),
            ),
            onTap: () async {
              currentIndex = 0;
              await savePref(currentIndex);
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Login()),
              // );
            },
          ),
          ListTile(
              leading: Icon(Icons.home, color: Colors.black87),
              title: Text(
                'Accueil',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: "QueenSemiBold",
                ),
              ),
              onTap: () async {
                currentIndex = 0;
                await savePref(currentIndex);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Body()),
                );
              }),
          ListTile(
              leading: Icon(FontAwesomeIcons.bookOpen, color: Colors.black87),
              title: Text(
                'Carte',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: "QueenSemiBold",
                ),
              ),
              onTap: () async {
                currentIndex = 1;
                await savePref(currentIndex);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Body()),
                );
              }),
          ListTile(
              leading: Icon(Icons.stars, color: Colors.black87),
              title: Text(
                'Prestation',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontFamily: "QueenSemiBold",
                ),
              ),
              onTap: () async {
                currentIndex = 2;
                await savePref(currentIndex);
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Body()),
                // );
              }),
          ListTile(
            leading: Icon(Icons.bookmark, color: Colors.black87),
            title: Text(
              'Réservation',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "QueenSemiBold",
              ),
            ),
            onTap: () async {
              currentIndex = 3;
              await savePref(currentIndex);
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Body()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.blur_on, color: Colors.black87),
            title: Text(
              'Actualités',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "QueenSemiBold",
              ),
            ),
            onTap: () async {
              currentIndex = 0;
              await savePref(currentIndex);
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ActualiteScreen()),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.near_me,
              color: Colors.black87,
            ),
            title: Text(
              'Nous contacter',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "QueenSemiBold",
              ),
            ),
            onTap: () async {
              currentIndex = 4;
              await savePref(currentIndex);
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Body()),
              // );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'QUITTER',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "QueenSemiBold",
              ),
            ),
            leading: Icon(Icons.exit_to_app, color: Colors.black87),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
