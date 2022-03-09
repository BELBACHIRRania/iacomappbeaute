import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/models/desserts.dart';
import 'package:iacomappbeaute/services/desserts-api.dart';
import 'package:iacomappbeaute/views/carte/desserts_details.dart';

class DessertsList extends StatefulWidget {
  @override
  _DessertsListState createState() => _DessertsListState();
}

class _DessertsListState extends State<DessertsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: fetchDesserts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Desserts desserts = snapshot.data[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DessertsDetailsScreen(desserts),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 5,
                                margin: EdgeInsets.only(
                                    left: 20, right: 120, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 5,
                                      spreadRadius: 1.0,
                                      color:
                                          Color(0xFFB0CCE1).withOpacity(0.32),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 20,
                                right: 170,
                                child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            '${desserts.nom_art}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontFamily: "QueenSeFmiBold",
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                              ),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                right: 170,
                                child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 5, bottom: 10),
                                          child: Text(
                                            '${desserts.prix_art}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '€',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontFamily: "Queen"
                                                //fontWeight: FontWeight.w100,
                                                ),
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Icon(
                                            Icons.access_time,
                                            color: Color(0xFFFFCC80),
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '${desserts.duree} min',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                              ),
                              Positioned(
                                top: -5,
                                left: 200,
                                right: 15,
                                bottom: -5,
                                child: Image.network(
                                  'http://iacomapp.cest-la-base.fr/${desserts.image_art}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ));
                    });
              }
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFFFCC80)),
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
