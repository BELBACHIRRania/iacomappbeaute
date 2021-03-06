import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:iacomappbeaute/views/body.dart';
import 'package:iacomappbeaute/views/nav_bar.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final _key = new GlobalKey<FormState>();

  List<String> type = [
    'Manucure traditionnelle',
    'Guinot t Yonka',
    'Epilation',
    'Soin et beauté du visage',
    'Soin anti-rides et aromatiques',
  ]; // Option 2
  String selectedType;

  String nom = "", mail = "", tel = "", detail = "";

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    }
  }

  submit() async {
    final response = await http
        .post("http://iacomapp.cest-la-base.fr/reservationBeauty.php", body: {
      "nom": nom,
      "mail": mail,
      "tel": tel,
      "type": selectedType,
      "info_complementaire": detail,
      "dates_resa": "${DateFormat('yyyy/MM/dd').format(selectedDateResa.toLocal())}".split(' ')[0],
      "mapp_id": '28',
      "heure_resa": '${time.hour}:${time.minute}',
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      print(message);
      ajoutToast(message);
      sendMailAdmin();
      sendMailClient();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Body()),
      );
    } else {
      print(message);
      ajoutToast(message);
    }
  }

  ajoutToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 2,
        backgroundColor: Color(0xFFDABCB2),
        textColor: Colors.black);
  }

  //Send Mail Admin
  Future sendMailAdmin() async {
    var response = await http.post("http://iacomapp.cest-la-base.fr/send_mail_admin.php", body: {
      "msg": "Réservation au nom de $nom.\nAdresse mail: $mail.\nNuméro de téléphone: $tel."
          "\nType de prestation: $selectedType.\nLe: ${DateFormat('yyyy/MM/dd').format(selectedDateResa.toLocal())}. A: ${time.hour}:${time.minute}."
          "\nDétails: $detail",
    });
    return json.decode(response.body);
  }

  //Send Mail Client
  Future sendMailClient() async {
    var response = await http.post("http://iacomapp.cest-la-base.fr/send_mail_client.php", body: {
      "msg": "Votre réservation a bien été prise en compte pour le ${DateFormat('yyyy/MM/dd').format(selectedDateResa.toLocal())}.\nA ${time.hour}:${time.minute}.",
      "mail": mail,
    });
    return json.decode(response.body);
  }

  /////////////////////////////////////////////////date picker //////////////////////////////////////////////////////////

  List<DateTime> datesResa;
  DateTime selectedDateResa = DateTime.now();
  DateTime dates_resa;

  Future<void> _selectDateResa(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: const Locale("fr", "FR"),
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023),
        //selectableDayPredicate: (DateTime val) => datesResa.contains(val),
        builder: (context, child) {
          return Theme(
            data: ThemeData(
              primaryColor: const Color(0xFFDABCB2),
              accentColor: const Color(0xFFDABCB2),
              colorScheme: ColorScheme.light(primary: const Color(0xFFDABCB2),),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        });
    if (picked != null && picked != selectedDateResa)
      setState(() {
        selectedDateResa = picked as DateTime;
        print("selectedDateResa");
        print(selectedDateResa);
      });
  }

  /////////////////////////////////////////////////time picker //////////////////////////////////////////////////////////

  TimeOfDay time, picked;

  @override
  void initState(){
    super.initState();
    time = TimeOfDay.now();
  }

  Future<Null> selectTime(BuildContext context) async{
    picked = await showTimePicker(
      context: context,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) {
        return new Localizations.override(
            context: context,
            locale: const Locale("fr", "FR"),
            child: child,
          );
      },
    );
    if(picked != null){
      setState(() {
        time = picked;
        print(time);
        print("time");
      });
    }
  }

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
                    )
                )
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, bottom: 5),
                      child: Text(
                        "RÉSERVEZ MAINTENANT!",
                        style: TextStyle(
                          fontSize: 13.7,
                          color: Colors.black,
                          fontFamily: "QueenBold",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          right: 60, left: 60, bottom: 10, top: 10),
                      elevation: 6.0,
                      child: TextFormField(
                        onSaved: (e) => nom = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.person, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "Queen",
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                            labelText: "Nom et Prénom"),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          right: 60, left: 60, bottom: 10, top: 10),
                      elevation: 6.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Veuillez entrer votre mail";
                          } else if (!EmailValidator.validate(e)) {
                            return "Mail invalide";
                          }
                        },
                        onSaved: (e) => mail = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.mail, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "Queen",
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                            labelText: "E-mail"),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          right: 60, left: 60, bottom: 10, top: 10),
                      elevation: 6.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Saisissez votre numéro de téléphone";
                          } else if (e.length < 10) {
                            return "Numéro de téléphone est invalide";
                          }
                        },
                        onSaved: (e) => tel = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.phone, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "Queen",
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                            labelText: "Téléphone"),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(right: 60, left: 60, bottom: 10, top: 10),
                      elevation: 6.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 20, top: 11, right: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: Color(0xFFCEAA9A),
                                  hint: Text(
                                    'Type de prestation',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Queen",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900
                                    ),
                                  ),
                                  value: selectedType,
                                  onChanged: (newValue) async {
                                    setState(() {
                                      selectedType = newValue;
                                    });
                                  },
                                  items: type.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          right: 60, left: 60, bottom: 10, top: 10),
                      elevation: 6.0,
                      child: TextFormField(
                        maxLength: 2000,
                        maxLines: null,
                        onSaved: (e) => detail = e,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Icon(Icons.blur_on, color: Colors.black),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "Queen",
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                            labelText: "Détail sur votre réservation"),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(right: 60, left: 60, bottom: 10, top: 10),
                      color: Colors.white,
                      elevation: 6.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                await _selectDateResa(context);
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(FontAwesomeIcons.calendarAlt,
                                      color: Colors.black),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "Date réservation",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Queen",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "${DateFormat('dd/MM/yyyy').format(selectedDateResa.toLocal())}"
                                              .split(' ')[0],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Queen",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(right: 60, left: 60, bottom: 10, top: 10),
                      color: Colors.white,
                      elevation: 6.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                await selectTime(context);
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.watch_later,
                                      color: Colors.black),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "Heure réservation",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Queen",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, bottom: 5, top: 5),
                                        child: Text(
                                          '${time.hour}:${time.minute}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Queen",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            check();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Envoyer votre demande",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Queen",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}