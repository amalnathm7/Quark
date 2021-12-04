import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quark/firebase/authentication/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Primary Color
  //used in Button,Button Shadow
  Color p1Color = Colors.cyanAccent;

  //Used as Container Color
  Color p2Color = Colors.white;

  //Screen Background [ Bluish ]
  Color p3Color = const Color(0xFFf1f7fc);

  //Used In Referl Text
  Color p4Color = const Color(0xFF5ce1e6);

  //For Manipulating Password Hiding
  bool passIcon = true;

  void passClicked() {
    setState(() {
      passIcon = !passIcon;
    });
  }

  //Focus And UnFocus In TextField
  bool focusEmail = false;
  bool focusPass = false;

  //TextField Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //login button
  bool loginClicked = false;

  //Error on login
  String errorTextMail = "";
  String errorTextPass = "";
  bool hasTypedMail = true;
  bool hasTypedPass = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: p3Color,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                top: 20, right: screenWidth * .023, left: screenWidth * .023),
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                SizedBox(
                  height: 300,
                  child: Center(
                    child: SizedBox(
                      height: 250,
                      width: screenWidth * .833,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: p2Color,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 10,
                                      color: Colors.black.withOpacity(.05),
                                      blurRadius: 20)
                                ],
                                image: const DecorationImage(
                                  image: AssetImage("assets/logo.png"),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Login To",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 20,
                                        letterSpacing: 1.2),
                                  ),
                                  Text(
                                    " Referl",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: p4Color,
                                      fontSize: 20,
                                      letterSpacing: 1.2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        child: Container(
                          height: 40,
                          width: screenWidth * .83,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  errorTextMail,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        top: errorTextMail.isEmpty || hasTypedMail ? 0 : 40,
                        curve: Curves.easeInOut,
                        onEnd: () {
                          setState(() {
                            if (hasTypedMail) errorTextMail = "";
                          });
                        },
                      ),
                      Positioned(
                        child: Container(
                            height: 55,
                            width: screenWidth * .83,
                            decoration: BoxDecoration(
                              color: p2Color,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: screenWidth * .5555,
                                    child: Center(
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: TextFormField(
                                            onChanged: (text) {
                                              if (emailController.text != "") {
                                                setState(() {
                                                  hasTypedMail = true;
                                                });
                                              }
                                            },
                                            controller: emailController,
                                            autofocus: true,
                                            cursorColor: Colors.grey,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                            decoration: const InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "Email Id",
                                                hintStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black12,
                                                ))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    width: screenWidth * .02777,
                                    child: Center(
                                        child: Container(
                                          height: 20,
                                          width: screenWidth * .00416,
                                          decoration: const BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    width: screenWidth * .111,
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.mail,
                                        color: Colors.grey.withOpacity(.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        child: Container(
                          height: 40,
                          width: screenWidth * .83,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  errorTextPass,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        top: errorTextPass.isEmpty || hasTypedPass ? 0 : 40,
                        curve: Curves.easeInOut,
                        onEnd: () {
                          setState(() {
                            if (hasTypedPass) errorTextPass = "";
                          });
                        },
                      ),
                      Positioned(
                        child: Container(
                            height: 55,
                            width: screenWidth * .8333,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: screenWidth * .5555,
                                    child: Center(
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: TextFormField(
                                            controller: passController,
                                            onChanged: (text) {
                                              if (passController.text != "") {
                                                setState(() {
                                                  hasTypedPass = true;
                                                });
                                              }
                                            },
                                            // autofocus: true,
                                            cursorColor: Colors.grey,
                                            obscureText: passIcon,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                            decoration: const InputDecoration(
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black12,
                                                ))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    width: screenWidth * .02777,
                                    child: Center(
                                        child: Container(
                                          height: 20,
                                          width: screenWidth * .00416,
                                          decoration: const BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: screenWidth * .111,
                                    child: Center(
                                      child: IconButton(
                                        color: Colors.grey.withOpacity(.5),
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        icon: !passIcon
                                            ? const Icon(
                                          Icons.remove_red_eye_outlined     ,
                                          color: Colors.grey,
                                        )
                                            : const Icon(
                                            Icons.visibility_off_outlined),
                                        onPressed: () {
                                          setState(() {
                                            passClicked();
                                          });
                                        },
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [
                                          BoxShadow(
                                            color: !passIcon
                                                ? Colors.black.withOpacity(.025)
                                                : Colors.white,
                                            spreadRadius: 6,
                                            blurRadius: 10,
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                loginClicked
                    ? const CupertinoActivityIndicator()
                    : Container(
                  height: 50,
                  width: screenWidth * .833,
                  decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.cyanAccent.withOpacity(.3),
                            spreadRadius: 5,
                            blurRadius: 30,
                            offset: const Offset(1, 1))
                      ]),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        hasTypedPass = false;
                        hasTypedMail = false;
                      });
                      if (emailController.text.trim().isEmpty &&
                          passController.text.trim().isEmpty) {
                        setState(() {
                          errorTextMail = "Email shouldn't be empty";
                          errorTextPass = "Password shouldn't be empty";
                        });
                      } else if (emailController.text.trim().isEmpty) {
                        setState(() {
                          errorTextMail = "Email shouldn't be empty";
                        });
                      } else if (passController.text.trim().isEmpty) {
                        setState(() {
                          errorTextPass = "Password shouldn't be empty";
                        });
                      } else {
                        setState(() {
                          loginClicked = true;
                        });
                        switch (await Authentication().signInEmailAndPassword(
                            emailController.text.trim(),
                            passController.text.trim())) {
                          case '':
                            break;
                          case 'user-not-found':
                            setState(() {
                              errorTextMail = "User not registered";
                              loginClicked = false;
                            });
                            break;
                          case 'wrong-password':
                            setState(() {
                              errorTextPass = "Wrong password";
                              loginClicked = false;
                            });
                            break;
                          case 'too-many-requests':
                            setState(() {
                              errorTextPass =
                              "Too many incorrect attempts";
                              loginClicked = false;
                            });
                            break;
                          default:
                            setState(() {
                              errorTextMail = "Invalid email";
                              loginClicked = false;
                            });
                            break;
                        }
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 1),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        overlayColor: MaterialStateProperty.all(
                            Colors.teal.withOpacity(.3)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF5ce1e6)),
                        shadowColor: MaterialStateProperty.all(p1Color),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(9))))),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
