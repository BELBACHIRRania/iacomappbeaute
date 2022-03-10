import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/views/carte/beaute_list.dart';
import 'package:iacomappbeaute/views/carte/epilation_list.dart';
import 'package:iacomappbeaute/views/carte/manucure_list.dart';
import 'package:iacomappbeaute/views/carte/soin_corps_list.dart';
import 'package:iacomappbeaute/views/carte/soin_visage_list.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ManucureList(),
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
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Row(
                            children: [
                              Container(
                                color: Color(0xFFCEAA9A),
                                width: 80,
                              ),
                              SizedBox(
                                width: 80,
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
                        top: 30,
                        left: 60,
                        //right: 170,
                        bottom: 20,
                        child: Image.asset('assets/images/21.png'),
                      )
                    ],
                  )
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EpilationList(),
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
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Row(
                            children: [
                              Container(
                                color: Color(0xFFCEAA9A),
                                width: 80,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text("Epilation",
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
                                    child: Text("Nous épilons les parties du visage avec le savoir-faire ancestral du fil qui est d’une grande précision. Pour le corps, nous utilisons de la cire de qualité qui respecte votre peau et évite de repasser plusieurs fois sur les mêmes zones.",
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
                        top: 30,
                        left: 60,
                        //right: 170,
                        bottom: 20,
                        child: Image.asset('assets/images/22.png'),
                      )
                    ],
                  )
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SoinVList(),
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
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Row(
                            children: [
                              Container(
                                color: Color(0xFFCEAA9A),
                                width: 80,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text("Soins du visage",
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
                                    child: Text("IACOM Beauty vous propose des soins esthétiques pour vos soins de visage.",
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
                        top: 30,
                        left: 60,
                        //right: 170,
                        bottom: 20,
                        child: Image.asset('assets/images/23.png'),
                      )
                    ],
                  )
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SoinCList(),
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
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Row(
                            children: [
                              Container(
                                color: Color(0xFFCEAA9A),
                                width: 80,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text("Soins du corps",
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
                                    child: Text("Des moments de bien-être et de détente absolue vous attendent.",
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
                        top: 30,
                        left: 60,
                        //right: 170,
                        bottom: 20,
                        child: Image.asset('assets/images/24.png'),
                      )
                    ],
                  )
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BeauteList(),
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
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          child: Row(
                            children: [
                              Container(
                                color: Color(0xFFCEAA9A),
                                width: 80,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text("Beauté",
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
                                    child: Text("IACOM Beauty vous invite à une pause beauté inégalée dans son centre de beauté à Biarritz.",
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
                        top: 30,
                        left: 60,
                        //right: 170,
                        bottom: 20,
                        child: Image.asset('assets/images/25.png'),
                      )
                    ],
                  )
              ),
              SizedBox(height: 15,)
            ],
          ),
        )
    );
  }
}
