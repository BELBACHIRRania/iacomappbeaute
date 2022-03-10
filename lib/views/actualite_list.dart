import 'package:flutter/material.dart';
import 'package:iacomappbeaute/models/actualite.dart';
import 'package:iacomappbeaute/services/actualite-api.dart';
import 'package:iacomappbeaute/views/actualite_details_screen.dart';
import 'package:iacomappbeaute/views/body.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';

class ActualiteScreen extends StatelessWidget {
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
            IconButton(
                icon: Icon(Icons.keyboard_backspace),
                iconSize: 30,
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Body()),
                  );
                }),
            SizedBox(
              width: 80,
            ),
            Container(
                margin: EdgeInsets.only(top: 10,),
                child: Text(
                  "IΛCOM Beauty",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "QueenBold"),
                )
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: fetchActualite(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      Actualite actualite = snapshot.data[index];
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ActualiteDetailsScreen(actualite)),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                child: Image.network(
                                  'http://iacomapp.cest-la-base.fr/${actualite.image_act}',
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 300,
                                alignment: Alignment.center,
                                child: Text(
                                  '${actualite.titre_act}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: 300,
                                alignment: Alignment.center,
                                child: Text(
                                  '${actualite.description_act}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
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
                            Color(0xFFCEAA9A),
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
