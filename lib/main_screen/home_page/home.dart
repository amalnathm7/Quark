import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:quark/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool notificationClick = false;
  bool graphAnimated = false;

  @override
  void initState() {
    super.initState();

    MyApp.db.addListener(listener);

    Timer(const Duration(microseconds: 1), () {
      setState(() {
        graphAnimated = true;
      });
    });
  }

  void listener() {
    setState(() {});
  }

  @override
  void dispose() {
    MyApp.db.removeListener(listener);
    super.dispose();
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
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
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
                                "   Always Save on using Energy 💡",
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
                                          notificationClick = true;
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
                    child: AnimatedContainer(
                      height: screenHeight / 5,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: graphAnimated
                                ? notificationClick
                                    ? Colors.transparent
                                    : Colors.black.withOpacity(.1)
                                : Colors.transparent,
                            spreadRadius: 1,
                            blurRadius: 50,
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 6),
                      curve: Curves.fastLinearToSlowEaseIn,
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
                                          " " +
                                              DateFormat.yMMMMd('en_US')
                                                  .format(DateTime.now())
                                                  .toString() +
                                              " ",
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
                                                MyApp.db.todayUsage.toString() +
                                                    " kWh",
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
                                                MyApp.db.monthUsage.toString() +
                                                    " kWh",
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
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Container(
                      height: screenHeight / 4,
                      width: screenWidth,
                      color: Colors.white10,
                      child: Column(
                        children: [
                          SizedBox(
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
                                        "Past 24 hours",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: .8),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Max: " +
                                      MyApp.db.hourlyUsage[MyApp.db.peakIndex]
                                          .toString() +
                                      " kWh",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      letterSpacing: .8),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 7.1,
                            child: ListView.builder(
                                itemCount: 8,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return AnimatedPadding(
                                    duration: const Duration(seconds: 4),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    padding: graphAnimated
                                        ? EdgeInsets.only(
                                            left: 15.5,
                                            right: 15.5,
                                            top: MyApp.db.category.isEmpty
                                                ? (screenHeight / 7.1)
                                                : (screenHeight / 7.1) -
                                                    (screenHeight / 7.1) *
                                                        (MyApp.db.hourlyUsage[
                                                                index] /
                                                            MyApp.db.hourlyUsage[
                                                                MyApp.db
                                                                    .peakIndex]),
                                          )
                                        : EdgeInsets.only(
                                            left: 15.5,
                                            right: 15.5,
                                            top: (screenHeight / 7.1),
                                          ),
                                    child: Container(
                                      width: screenWidth / 35,
                                      decoration: BoxDecoration(
                                          color: index == MyApp.db.peakIndex
                                              ? Colors.black
                                              : Colors.black.withOpacity(.2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: index == MyApp.db.peakIndex
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  AnimatedContainer(
                                                    height: graphAnimated
                                                        ? screenWidth / 50
                                                        : 0,
                                                    width: graphAnimated
                                                        ? screenWidth / 50
                                                        : 0,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                    duration: const Duration(
                                                        seconds: 5),
                                                    curve: Curves
                                                        .fastLinearToSlowEaseIn,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: screenHeight / 17,
                            width: screenWidth / 1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Text(
                                    "0-3",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "3-6",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "6-9",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "9-12",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "12-15",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "15-18",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "18-21",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "21-24",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(.5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
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
                  AnimatedContainer(
                    height: screenHeight / 4.5,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1.5, color: Colors.grey.withOpacity(.15)),
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
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 10),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(.4)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(.7)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: screenHeight / 7.2,
                                      width: screenWidth / 3.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              MyApp.db.remainingCredits
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 55,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              MyApp.db.currentPlan == null
                                                  ? "Remaining out of 0 credits"
                                                  : "Remaining out of " +
                                                      MyApp
                                                          .db
                                                          .currentPlan![
                                                              'credits']
                                                          .toString() +
                                                      " credits",
                                              overflow: TextOverflow.clip,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: screenWidth / 2,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.09),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: MyApp.db.currentPlan == null
                                                ? 0
                                                : (((screenWidth / 2) /
                                                        (MyApp.db.currentPlan![
                                                                'credits'] *
                                                            1.15)) *
                                                    (MyApp.db.currentPlan![
                                                            'credits'] *
                                                        0.15)),
                                            decoration: BoxDecoration(
                                                color:
                                                    Colors.red.withOpacity(.8),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 2),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            height: 30,
                                            width: graphAnimated
                                                ? MyApp.db.currentPlan == null
                                                    ? 0
                                                    : ((screenWidth / 2) /
                                                            (MyApp.db.currentPlan![
                                                                    'credits'] *
                                                                1.15)) *
                                                        (MyApp.db.currentPlan![
                                                                'credits'] -
                                                            MyApp.db
                                                                .remainingCredits)
                                                : 0,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  AnimatedContainer(
                                                    duration: const Duration(
                                                        seconds: 5),
                                                    curve: Curves
                                                        .fastLinearToSlowEaseIn,
                                                    height:
                                                        graphAnimated ? 20 : 0,
                                                    width:
                                                        graphAnimated ? 10 : 0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
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
                            const SizedBox(
                              height: 10,
                            ),
                            AnimatedContainer(
                              height: screenHeight / 22,
                              width: screenWidth / 1.2,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: graphAnimated
                                          ? Colors.black.withOpacity(.2)
                                          : Colors.transparent,
                                      spreadRadius: 1,
                                      blurRadius: 50,
                                    ),
                                  ],
                                  color: Colors.white,
                                  // border: Border.all(width: 1,color: Colors.grey),
                                  borderRadius: BorderRadius.circular(6)),
                              duration: const Duration(seconds: 4),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    MyApp.db.currentPlan == null
                                        ? "Plan NIL"
                                        : "Plan " +
                                            MyApp.db.currentPlan!['amount']
                                                .toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .8,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    height: screenHeight / 40,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.4),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  Container(
                                    height: screenHeight / 30,
                                    width: screenWidth / 2,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          MyApp.db.currentPlan == null
                                              ? "Validity  :  NIL"
                                              : "Validity  :  " +
                                                  DateFormat.yMMMMd('en_US')
                                                      .format(MyApp
                                                          .db
                                                          .currentPlan![
                                                              'validity']
                                                          .toDate())
                                                      .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.black.withOpacity(.8),
                                          ),
                                        )
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
                      height: notificationClick ? screenHeight / 1.45 : 0,
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
                                          notificationClick = false;
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
                              Container(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 1, right: 1),
                                child: Container(
                                  height: 100,
                                  width: screenWidth / 1.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.1),
                                        spreadRadius: 1,
                                        blurRadius: 90,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: screenWidth / 1.1,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              "https://image.freepik.com/free-photo/closeup-shot-lit-large-lightbulb-with-blurred-background_181624-2051.jpg",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                          height: 100,
                                          width: screenWidth / 1.1,
                                          child: Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 10,
                                                  top: 15,
                                                  bottom: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaY: 16, sigmaX: 16),
                                                  child: Container(
                                                    height: 75,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(.03),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "\" Save Energy For Tomorrow \"",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    .8),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: .8,
                                                            shadows: const [
                                                              Shadow(
                                                                blurRadius:
                                                                    20.0,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 100,
                                        width: screenWidth / 1.1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      "assets/logo.png",
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 1, right: 1),
                                child: Container(
                                  height: 100,
                                  width: screenWidth / 1.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          width: screenWidth / 4,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Container(
                                                height: screenWidth / 8,
                                                width: screenWidth / 8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black,
                                                ),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Lottie.network(
                                                        "https://assets8.lottiefiles.com/packages/lf20_isk1zq7k.json")),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: SizedBox(
                                            height: 100,
                                            width: screenWidth / 1.8,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Load Shedding",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Container(
                                                            height: 7,
                                                            width: 2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                        const Text(
                                                          "10:12",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              letterSpacing:
                                                                  .8),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          CupertinoIcons
                                                              .clock_solid,
                                                          size: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            "3:00 - 4:00 PM",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      .8),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          CupertinoIcons
                                                              .calendar,
                                                          size: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            "4 Dec 2021",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      .8),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 1, right: 1),
                                child: Container(
                                  height: 100,
                                  width: screenWidth / 1.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.09),
                                        spreadRadius: 1,
                                        blurRadius: 90,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 1, right: 1),
                                child: Container(
                                  height: 100,
                                  width: screenWidth / 1.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 1, right: 1),
                                child: Container(
                                  height: 100,
                                  width: screenWidth / 1.1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
