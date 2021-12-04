import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool notiClick = false;
  bool graphAni = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(microseconds: 1), () {
      setState(() {
        graphAni = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 55),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight / 10,
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenHeight / 4.5,
                          width: screenWidth / 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FirebaseAuth.instance.currentUser!
                                            .displayName !=
                                        null
                                    ? "Welcome " +
                                        FirebaseAuth
                                            .instance.currentUser!.displayName!
                                    : "Welcome " +
                                        FirebaseAuth
                                            .instance.currentUser!.email!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  letterSpacing: .8,
                                ),
                              ),
                              const Text(
                                "Always Save on using energy",
                                style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: .8,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          notiClick = true;
                                        });
                                      },
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.3),
                                                  blurRadius: 60,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 43,
                                                width: 43,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(.15),
                                                        blurRadius: 60,
                                                        spreadRadius: 1,
                                                      ),
                                                    ]),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.network(
                                                      "https://images.pexels.com/photos/3031397/pexels-photo-3031397.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                      child: Lottie.network(
                                          "https://assets8.lottiefiles.com/private_files/lf30_spmses83.json"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: screenHeight / 5,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: notiClick
                                ? Colors.transparent
                                : Colors.black.withOpacity(.1),
                            spreadRadius: 1,
                            blurRadius: 50,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Energy Usage",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: screenHeight / 25,
                                    width: screenWidth / 2.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.calendar,
                                          size: 15,
                                          color: Colors.black.withOpacity(.8),
                                        ),
                                        Text(
                                          "4 Dec 2021",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withOpacity(.3)),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.4),
                                                spreadRadius: 1,
                                                blurRadius: 50,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 13,
                                            color: Colors.black.withOpacity(.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Container(
                              height: 1.2,
                              width: screenWidth / 1.2,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.12),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: screenHeight / 9,
                                    width: screenWidth / 3,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.electrical_services),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Today",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(.3)),
                                              ),
                                              Container(
                                                height: 8,
                                              ),
                                              Text(
                                                "28.6 kWh",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(.9)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: screenHeight / 9,
                                    width: screenWidth / 3,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.bolt),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "This Month",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(.3)),
                                              ),
                                              Container(
                                                height: 8,
                                              ),
                                              Text(
                                                "560.6 kWh",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                        .withOpacity(.9)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: screenHeight / 4,
                      width: screenWidth,
                      color: Colors.white10,
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight / 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: screenHeight / 80,
                                      width: 2.5,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Hourwise",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: .8),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Max : 50kWh",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      letterSpacing: .8),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: screenHeight / 7.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                AnimatedContainer(
                                  height: graphAni
                                      ? (screenHeight / 7.7) * (20 / 50)
                                      : 0,
                                  width: screenWidth / 40,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                                AnimatedContainer(
                                  height: graphAni
                                      ? (screenHeight / 7.7) * (40 / 50)
                                      : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                                AnimatedContainer(
                                  height: graphAni
                                      ? (screenHeight / 7.7) * (35 / 50)
                                      : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                                AnimatedContainer(
                                  height: graphAni
                                      ? (screenHeight / 7.7) * (15 / 50)
                                      : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                                AnimatedContainer(
                                  height: graphAni ? screenHeight / 7.7 : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AnimatedContainer(
                                          height:
                                              graphAni ? screenWidth / 50 : 0,
                                          width:
                                              graphAni ? screenWidth / 50 : 0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          duration: const Duration(seconds: 5),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  height: graphAni
                                      ? (screenHeight / 7.7) * (30 / 50)
                                      : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                                AnimatedContainer(
                                  height: graphAni ? 3 : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                                AnimatedContainer(
                                  height: graphAni ? 3 : 0,
                                  width: screenWidth / 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  duration: const Duration(seconds: 4),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "9",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "15",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "18",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "21",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    height: screenHeight / 5,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.05),
                      // gradient:LinearGradient(
                      //   begin: Alignment.topRight,
                      //     end: Alignment.bottomLeft,
                      //     colors: [
                      //
                      //       Colors.grey,
                      //       Colors.white
                      //     ]
                      // ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Stack(
                      children: [




                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,top:10),
                              child: Container(
                                height:100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(.4)
                                ),
                              ),
                            ),




                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,top:5),
                          child: Container(
                            height:40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(.7)
                            ),
                          ),
                        ),








                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: screenHeight/9,
                                      width: screenWidth/3.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "500",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 55,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Remaining Out Of 1700",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: screenWidth/2,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.09),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: (((screenWidth/2)/1725)*(1500*(15)/100)),
                                            decoration: BoxDecoration(
                                                color: Colors.red.withOpacity(.8),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            curve: Curves.fastLinearToSlowEaseIn,
                                            height: 30,
                                            width: graphAni?(((screenWidth/2)/1725)*1000):0,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(right:10.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  AnimatedContainer(
                                                    duration: Duration(seconds: 5),
                                                    curve: Curves.fastLinearToSlowEaseIn,
                                                    height:graphAni? 20:0,
                                                    width: graphAni?10:0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius: BorderRadius.circular(3)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: screenHeight/22,
                              width: screenWidth/1.2,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.02),
                                      spreadRadius: 1,
                                      blurRadius: 80,
                                    ),
                                  ],
                                color: Colors.white,
                                // border: Border.all(width: 1,color: Colors.grey),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  [
                                  Text("Plan 444",style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .8,
                                    color: Colors.black,
                                  ),),
                                  Container(
                                    height: screenHeight/40,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.4),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                  ),

                                  Container(
                                    height: screenHeight/30,
                                    width: screenWidth/2,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Validity  :  23 Dec 2021",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(.8),
                                        ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight / 8,
                ),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: notiClick ? screenHeight / 1.45 : 0,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            spreadRadius: 1,
                            blurRadius: 50,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: screenWidth / 1.1,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: screenWidth / 3.5,
                                    ),
                                    const Text(
                                      "Notifications",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15,
                                          letterSpacing: .7),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          notiClick = false;
                                        });
                                      },
                                      child: SizedBox(
                                        width: screenWidth / 3.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: const [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Icon(
                                                CupertinoIcons.clear,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
