import 'package:flutter/material.dart';
import 'package:iacomappbeaute/models/beaute.dart';
import 'package:iacomappbeaute/services/beaute-api.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';

class BeauteList extends StatefulWidget {
  @override
  _SoinVListState createState() => _SoinVListState();
}

class _SoinVListState extends State<BeauteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDABCB2),
      endDrawer: NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "IΛCOM Beauty",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
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
            future: fetchBeaute(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Beaute beaute = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                              child: Image.network(
                                'http://iacomapp.cest-la-base.fr/${beaute.image_art}',
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
                                '${beaute.nom_art}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: "QueenSemiBold",
                                ),
                              ),
                            ),
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
                                    '${beaute.duree} min',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 160,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 5, bottom: 10),
                                  child: Text(
                                    '${beaute.prix_art}',
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
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              width: 300,
                              alignment: Alignment.center,
                              child: Text(
                                '${beaute.description}',
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
                            Color(0xFFDABCB2),
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
