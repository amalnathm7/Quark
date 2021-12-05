import 'package:flutter/cupertino.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Container(
                height: 50,
                width:screenWidth ,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(.1),
                        blurRadius: 60,
                        spreadRadius: 1,
                      ),
                    ]
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15),
                      child: Icon(CupertinoIcons.location_solid,size: 18,),
                    ),
                    Text("Tkm College Of Engineering, Karikode, Kollam",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 12,letterSpacing: .5
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
