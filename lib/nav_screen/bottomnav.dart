import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:quark/main_screen/electric_car_page/electric_car.dart';
import 'package:quark/main_screen/home_page/home.dart';
import 'package:quark/main_screen/profile_page/profile.dart';
import 'package:quark/main_screen/topup_page/topup.dart';


class NavBarNew extends StatefulWidget {
  const NavBarNew({Key? key}) : super(key: key);

  @override
  _NavBarNewState createState() => _NavBarNewState();
}

class _NavBarNewState extends State<NavBarNew> {
  int _selectedIndex = 0;
  PageController _controllerPage = PageController();
  bool notify = false;






  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        controller: _controllerPage,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
            print(index);
          });
        },
        children: [
          HomePage(),
          TopUpPage(),
          ElectricCar(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: screenHeight * .1 <= 60 ? 60 : screenHeight * .1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 0;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                });
              },
              child: _selectedIndex == 0
                  ? Icon(CupertinoIcons.house_fill)
                  : Icon(CupertinoIcons.house),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 1;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                });
              },
              child: _selectedIndex == 1
                  ? Icon(CupertinoIcons.square_favorites_fill)
                  : Icon(CupertinoIcons.square_favorites),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 2;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                });
              },
              child: _selectedIndex == 2
                  ? Icon(CupertinoIcons.square_favorites_alt_fill)
                  : Icon(CupertinoIcons.square_favorites_alt),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  //depth: 8,
                  lightSource: LightSource.topLeft,
                  color: notify ? Colors.green[100] : Colors.white),
              onPressed: () {
                setState(() {
                  int prev = _selectedIndex;
                  _selectedIndex = 3;
                  notify = false;

                  int diff = prev - _selectedIndex;
                  diff.abs() > 1
                      ? _controllerPage.jumpToPage(_selectedIndex)
                      : _controllerPage.animateToPage(_selectedIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                });
              },
              child: _selectedIndex == 3
                  ? Icon(
                CupertinoIcons.group_solid,
                size: 27,
              )
                  : Icon(
                CupertinoIcons.group,
                size: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
