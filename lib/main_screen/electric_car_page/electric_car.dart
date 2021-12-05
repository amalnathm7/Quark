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
                    child: Image.network(
                        "https://cdn.dribbble.com/users/3768353/screenshots/15134626/media/99196c9efa812cc1d6b448d589113fff.png?compress=1&resize=1600x1200"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 15, right: 15),
                    child: Container(
                      height: 45,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 60,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 8),
                            child: Icon(
                              CupertinoIcons.location_solid,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 2,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Tkm College Of Engineering, Karikode, Kollam",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: .5,
                                  color: Colors.grey),
                            ),
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
                          height: screenHeight / 1.75,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15))),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: screenWidth,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors.black.withOpacity(.7),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 14.0),
                                          child: Text(
                                            "Nearby  Charging  Station",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Colors.black.withOpacity(.8),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Kseb kottarakara",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    CupertinoIcons.arrow_branch,
                                                    size: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "12 km",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Available",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                height: 2,
                                                width: screenWidth / 1.3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.1),
                                                  blurRadius: 90,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SingleChildScrollView(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "9:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "12",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "11:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "8",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "17:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "15",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Glx punaloor",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    CupertinoIcons.arrow_branch,
                                                    size: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "10 km",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Available",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                height: 2,
                                                width: screenWidth / 1.3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.1),
                                                  blurRadius: 90,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SingleChildScrollView(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "10:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "3",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "14:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "1",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Kseb Ochira",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    CupertinoIcons.arrow_branch,
                                                    size: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "4 km",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Available",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                height: 2,
                                                width: screenWidth / 1.3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.1),
                                                  blurRadius: 90,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SingleChildScrollView(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "11:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "3",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Jkf Varkala",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    CupertinoIcons.arrow_branch,
                                                    size: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "10 km",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Available",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                height: 2,
                                                width: screenWidth / 1.3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.1),
                                                  blurRadius: 90,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SingleChildScrollView(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "10:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "1",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "13:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "9",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 40,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 60,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: const [
                                                                  Icon(
                                                                    CupertinoIcons
                                                                        .clock_solid,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "17:00",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                    "14",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            .8),
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
