import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iacomappbeaute/models/menus.dart';
import 'package:iacomappbeaute/services/menus-api.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCC80),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 150,
            ),
            Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Menus",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "QueenBold"),
                    ))),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: fetchMenus(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Menus menus = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 5,
                              spreadRadius: 1.0,
                              color: Color(0xFFB0CCE1).withOpacity(0.32),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              child: Image.network(
                                'http://iacomapp.cest-la-base.fr/${menus.image_art}',
                                height: MediaQuery.of(context).size.height / 5,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.only(
                                left: 35,
                              ),
                              child: Text(
                                '${menus.nom_art}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: "QueenSemiBold",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 17,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 17,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 17,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 17,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 17,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 130,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 5, bottom: 10),
                                    child: Text(
                                      '${menus.prix_art}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '€',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontFamily: "Queen"),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10, left: 30),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Color(0xFFFFCC80),
                                    size: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    '${menus.duree} min',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    FontAwesomeIcons.weight,
                                    color: Color(0xFFFFCC80),
                                    size: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    '380 Gr',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    FontAwesomeIcons.fireAlt,
                                    color: Color(0xFFFFCC80),
                                    size: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    '296 Kcal',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              width: 300,
                              alignment: Alignment.center,
                              child: Text(
                                '${menus.description}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: "Queen"),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      );
                    });
              }
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFFFCC80),
                          ),
                          strokeWidth: 5),
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
