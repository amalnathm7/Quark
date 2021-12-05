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
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.83),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: screenWidth,
                    child: Image.network("https://cdn.dribbble.com/users/3768353/screenshots/15134626/media/99196c9efa812cc1d6b448d589113fff.png?compress=1&resize=1600x1200"),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:50.0,left: 15,right: 15),
                    child: Container(
                      height: 45,
                      width:screenWidth ,
                      decoration: BoxDecoration(
                        color: Colors.black,
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
                          const Padding(
                            padding: EdgeInsets.only(left:15.0,right: 8),
                            child: Icon(CupertinoIcons.location_solid,size: 18,color: Colors.grey,),
                          ),
                          Container(
                            height: 10,
                            width: 2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2)
                            ),
                          ),
                          const Padding(

                            padding: EdgeInsets.only(left:8.0),
                            child: Text("Tkm College Of Engineering, Karikode, Kollam",style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 12,letterSpacing: .5,
                              color: Colors.grey
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          height: screenHeight/1.75,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: screenWidth,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 4,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2),
                                            color: Colors.black.withOpacity(.7),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 14.0),
                                          child: Text("Nearby Charging Station",style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black.withOpacity(.8),
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
