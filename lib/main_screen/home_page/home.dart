import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight/10,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenHeight/4.5,
                      width: screenWidth/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  const [
                          Text("Welcome Dinoy",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: .8,
                          ),),

                          Text("Always Save on using energy",style: TextStyle(
                            fontSize: 10,
                            letterSpacing: .8,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),),

                        ],
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 50,
                        width:50,
                        decoration:  BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 60,
                              spreadRadius: 1,

                            ),
                          ]
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                            Container(
                            height: 43,
                            width:43,
                            decoration:  BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.15),
                                    blurRadius: 60,
                                    spreadRadius: 1,
                                  ),
                                ]
                            ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network("https://images.pexels.com/photos/3031397/pexels-photo-3031397.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",fit: BoxFit.cover,)),
                            ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: screenHeight/5,
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Text("Energy Usage",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black
                              ),
                              ),
                              SizedBox(
                                height: screenHeight/25,
                                width: screenWidth/2.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(CupertinoIcons.calendar,size: 15,color: Colors.black.withOpacity(.8),),
                                    Text("4 Dec 2021",style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(.3)
                                    ),),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(.4),
                                            spreadRadius: 1,
                                            blurRadius: 50,
                                          ),
                                        ],
                                      ),
                                        child: Icon(CupertinoIcons.chevron_down,size: 13,color: Colors.black.withOpacity(.6),),
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
                          width: screenWidth/1.2,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.12),
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: screenHeight/9,
                                width: screenWidth/3,
                                decoration: const BoxDecoration(
                                  color:Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.electrical_services),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Column(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Today",style: TextStyle(
                                            fontSize:12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black.withOpacity(.3)
                                          ),),

                                          Container(
                                            height: 8,
                                          ),

                                          Text("28.6 kWh",style: TextStyle(
                                              fontSize:18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(.9)
                                          ),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                height: screenHeight/9,
                                width: screenWidth/3,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.bolt),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Column(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("This Month",style: TextStyle(
                                              fontSize:12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(.3)
                                          ),),

                                          Container(
                                            height: 8,
                                          ),

                                          Text("560.6 kWh",style: TextStyle(
                                              fontSize:18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black.withOpacity(.9)
                                          ),),
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
            ],
          ),
        ),
      ),
    );
  }
}
