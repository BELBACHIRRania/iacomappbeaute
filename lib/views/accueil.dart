import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/models/manucure.dart';
import 'package:iacomappbeaute/views/carousel_slider.dart';
import 'package:iacomappbeaute/views/carte/beaute_list.dart';
import 'package:iacomappbeaute/views/carte/epilation_list.dart';
import 'package:iacomappbeaute/views/carte/manucure_list.dart';
import 'package:iacomappbeaute/views/carte/soin_corps_list.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';

import 'carte/soin_visage_list.dart';

class Accueil extends StatelessWidget {
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
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      Container(
                          height: 330,
                          child: CarouselExample()
                      ),
                      SizedBox(height: 15),
                      Container(
                        color: Colors.white,
                        height: 185,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Container(
                              width: 380,
                              child: Text("Nos services",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "QueenBold"),
                              ),
                            ),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: 140,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 18),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ManucureList()),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/21.png"),
                                                      fit: BoxFit.fill
                                                  )
                                              ),
                                              height: 90,
                                              width: 93,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => EpilationList()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/22.png"),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          height: 90,
                                          width: 93,
                                        ),
                                      ),
                                          SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SoinVList()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/23.png"),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          height: 90,
                                          width: 93,
                                        ),
                                      ),
                                          SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SoinCList()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/24.png"),
                                                fit: BoxFit.fill
                                              )
                                          ),
                                          height: 90,
                                          width: 93,
                                        ),
                                      ),
                                          SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => BeauteList()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/25.png"),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                          height: 90,
                                          width: 93,
                                        ),
                                      ),
                                          SizedBox(width: 15),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 95,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 30),
                                          Container(
                                            height: 42,
                                            child: Text("Manucure",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: "QueenSemiBold"),
                                            ),
                                          ),
                                          SizedBox(width: 45),
                                          Container(
                                            height: 42,
                                            child: Text("Epilations",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: "QueenSemiBold"),
                                            ),
                                          ),
                                          SizedBox(width: 45),
                                          Container(
                                            width: 80,
                                            child: Text("Soins du visage",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: "QueenSemiBold"),
                                            ),
                                          ),
                                          SizedBox(width:25),
                                          Container(
                                            width: 80,
                                            child: Text("Soins du corps",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: "QueenSemiBold"),
                                            ),
                                          ),
                                          SizedBox(width: 33),
                                          Container(
                                            height: 42,
                                            child: Text("Beauté",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontFamily: "QueenSemiBold"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 380,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 5,
                              spreadRadius: 5,
                              color: Color(0xFFB0CCE1).withOpacity(0.15),
                            ),
                          ],
                        ),
                        padding:
                            EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                        child: Text(
                            "Le salon IACOM Beauty ous accueille à Biarritz(64), dans le département des Pyrénées-Atlantiques en région Aquitaine.\n"
                                "\n Votre salon vous propose de nombreuses prestaions pour embellir vos cheuveux. Vous avez la possibilité, sur rendez-vous, de vous détendre lorsque nous vus apportons une touche finale, grâce aux soins esthétiques proposés.\n"
                                "\n Fort de ses 33 années d'expérience et de sa spécialité en conseil visagisme le salon IACOM Beauty vous apporte l'écoute, le conseil et le savoir-faire.",style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "QueenSemiBold"),
                            textAlign: TextAlign.justify),
                      ),
                      SizedBox(height: 15),
                    ]
                )
            )
        )
    );
  }
}
