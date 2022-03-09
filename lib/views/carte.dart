import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/carte/desserts_list.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';

class Carte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarteState();
  }
}

class CarteState extends State<Carte> {
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
                  width: 90,
                ),
                Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "IΛCOM Restaurant",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "QueenBold"),
                        ))),
              ],
            ),
          ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DessertsList(),
                  ),
                );
              },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      height: 150,
                      width: 350,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            color: Color(0xFFCEAA9A),
                            width: 80,
                          ),
                          SizedBox(
                            width: 85,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 100,
                                child: Text("Manucure",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "QueenBold"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 180,
                                child: Text("IACOM Beauty prend soin de vos mains. Un service professionnel de manucure qui maitrise parfaitement la pose complète de gel, la pose de vernis ou de semi-permanent.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ),
                    Positioned(
                      top: 50,
                      left: 60,
                      //right: 170,
                      bottom: 20,
                      child: Image.asset('assets/images/21.png'),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}
