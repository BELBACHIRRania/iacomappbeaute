import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final List<String> images = [
    'assets/images/21.png',
    'assets/images/22.png',
    'assets/images/23.png',
    'assets/images/24.png',
    'assets/images/25.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 330.0,
        width: double.infinity,
        child: Carousel(
          dotSpacing: 15.0,
          dotSize: 6.0,
          dotIncreasedColor: Color(0xFFDABCB2),
          dotBgColor: Colors.transparent,
          indicatorBgPadding: 10.0,
          dotPosition: DotPosition.bottomCenter,
          images: images
              .map((item) => Container(
            child: Image.asset(
              item,
              fit: BoxFit.fill,
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}