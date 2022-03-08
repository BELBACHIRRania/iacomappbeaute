import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/carousel_slider.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';

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
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Container(
                              width: 380,
                              child: Text("Nos services",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "QueenBold"),
                              ),
                            ),
                            SizedBox(height: 15),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      //SizedBox(width: 18),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/21.png"),
                                            )
                                        ),
                                        height: 97,
                                        width: 100,
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/22.png"),
                                            )
                                        ),
                                        height: 97,
                                        width: 100,
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/23.png"),
                                            )
                                        ),
                                        height: 97,
                                        width: 100,
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/24.png"),
                                            )
                                        ),
                                        height: 97,
                                        width: 100,
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/25.png"),
                                            )
                                        ),
                                        height: 97,
                                        width: 100,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(left: 5, ),
                                        height: 97,
                                        width: 70,
                                        child: Text("Manicurie"),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 97,
                                        width: 120,
                                        child: Text("Epilations"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 12, ),
                                        height: 97,
                                        width: 120,
                                        child: Text("Soins du visage"),
                                      ),
                                      Container(
                                        height: 97,
                                        width: 120,
                                        child: Text("Soins du corps"),
                                      ),
                                      Container(
                                        //margin: EdgeInsets.only(left: , ),
                                        height: 97,
                                        width: 120,
                                        child: Text("Beauté"),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 400,
                        width: 500,
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
                        margin: EdgeInsets.only(left: 30, right: 30),
                        padding:
                            EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                        child: Text(
                            "IΛCOM Restaurant est un restaurant asiatique situé dans le département de la Gironde, à Bassens. Spécialisés dans la cuisine japonaise et thaïlandaise, nous vous proposons le meilleur Sushi à Bassens\n"
                            "\nDe la décoration jusqu’à dans l'assiette notre maître mot est le dépaysement. La légendaire zénitude asiatique s’exprime à travers une décoration branchée aux tons neutres, un cadre en osmose avec la musique d’ambiance aux airs chill-out. Fraîcheur et qualité supérieure sont les mots d’ordre côté cuisine. ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "QueenSemiBold"),
                            textAlign: TextAlign.justify),
                      ),
                    ]
                )
            )
        )
    );
  }
}
