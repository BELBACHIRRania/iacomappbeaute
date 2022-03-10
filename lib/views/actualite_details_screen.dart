import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iacomappbeaute/models/actualite.dart';
import 'package:iacomappbeaute/views/actualite_list.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ActualiteDetailsScreen extends StatelessWidget {
  final Actualite actualite;

  ActualiteDetailsScreen(this.actualite);

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
                  Navigator.pop(context);
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'http://iacomapp.cest-la-base.fr/${actualite.image_act}',
                    fit: BoxFit.cover,
                    width: 300,
                    height: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${actualite.titre_act}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${actualite.description_act}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              GestureDetector(
                  child: actualite.moreLink == null
                      ? Container()
                      : new Text(
                          "${actualite.moreLink}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w900),
                        ),
                  onTap: () {
                    launch('${actualite.moreLink}');
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
