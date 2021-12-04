import 'package:flutter/material.dart';

class ElectricCar extends StatefulWidget {
  const ElectricCar({Key? key}) : super(key: key);

  @override
  _ElectricCarState createState() => _ElectricCarState();
}

class _ElectricCarState extends State<ElectricCar> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: const Text(
            'Hi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        )
    );
  }
}
