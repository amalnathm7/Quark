import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quark/firebase/authentication/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _isLogOutClicked = false;
  static bool isLoading = false;
  final _user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFf6fafd),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 0,
                          ),
                          child: SizedBox(
                            height: 250,
                            width: screenWidth,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://images.pexels.com/photos/3031397/pexels-photo-3031397.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          _user.displayName!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          _user.email!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Household",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _isLogOutClicked
                ? const CupertinoActivityIndicator()
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 30),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLogOutClicked = true;
                        });
                        await Authentication().signOut();
                        setState(() {
                          _isLogOutClicked = false;
                        });
                      },
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.logout_sharp,
                          color: Colors.grey[700],
                        ),
                        label: Text(
                          "Log out",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
            SizedBox(
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Save Energy\nFor All Life\n\n💡",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A Hack4TKM Initiative by Team Gryffindor",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "©2021 Gryffindor™",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
