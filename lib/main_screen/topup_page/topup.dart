import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quark/main.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> with TickerProviderStateMixin {
  final _user = FirebaseAuth.instance.currentUser!;
  bool _searchClicked = false;

  @override
  void initState() {
    super.initState();
    MyApp.db.addListener(listener);
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
    final _tabController = TabController(length: 3, vsync: this);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _searchClicked
                          ? Container(
                              width: MediaQuery.of(context).size.width / 1.25,
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: "Enter amount (in Rs.)",
                                  contentPadding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[300]!)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[700]!)),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                _user.displayName == null
                                    ? "Recharge Plans\nfor " + _user.email!
                                    : "Recharge Plans\nfor " +
                                        _user.displayName!,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _searchClicked = !_searchClicked;
                          });
                        },
                        splashRadius: 20,
                        icon: Icon(
                          _searchClicked
                              ? CupertinoIcons.clear
                              : CupertinoIcons.search,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text(
                        "Recommended",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Monthly",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Add-on",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.builder(
                        itemCount: MyApp.db.recommendedPlans.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pay ₹" +
                                              (MyApp.db.recommendedPlans[index]
                                                          ['amount'] +
                                                      MyApp.db.baseAmount)
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "(Base charge (₹" +
                                              MyApp.db.baseAmount.toString() +
                                              ") + Plan amount)",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Container(
                                        color: Colors.black,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "₹ " +
                                              MyApp
                                                  .db
                                                  .recommendedPlans[index]
                                                      ['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[100]!,
                                              offset: const Offset(0, 0),
                                              spreadRadius: 2,
                                              blurRadius: 2)
                                        ],
                                      ),
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[100]!,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 2,
                                                blurRadius: 2)
                                          ],
                                        ),
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.only(right: 20),
                                          tileColor: Colors.grey[100],
                                          trailing: Text(
                                            MyApp
                                                    .db
                                                    .recommendedPlans[index]
                                                        ['validity']
                                                    .toString() +
                                                " \ndays",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          title: Text(
                                            MyApp.db.recommendedPlans[index]
                                                    ['per_day']
                                                ? MyApp
                                                        .db
                                                        .recommendedPlans[index]
                                                            ['credits']
                                                        .toString() +
                                                    " \ncredits/day ⚡"
                                                : MyApp
                                                        .db
                                                        .recommendedPlans[index]
                                                            ['credits']
                                                        .toString() +
                                                    " \ncredits ⚡",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          subtitle: Text(
                                            MyApp
                                                .db
                                                .recommendedPlans[index]
                                                    ['details']
                                                .toString(),
                                            style: const TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: MyApp.db.monthlyPlans.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pay ₹" +
                                              (MyApp.db.monthlyPlans[index]
                                                          ['amount'] +
                                                      MyApp.db.baseAmount)
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "(Base charge (₹" +
                                              MyApp.db.baseAmount.toString() +
                                              ") + Plan amount)",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Container(
                                        color: Colors.black,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "₹ " +
                                              MyApp.db
                                                  .monthlyPlans[index]['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey[100]!,
                                                  offset: const Offset(0, 0),
                                                  spreadRadius: 2,
                                                  blurRadius: 2)
                                            ],
                                          ),
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[100]!,
                                                    offset: const Offset(0, 0),
                                                    spreadRadius: 2,
                                                    blurRadius: 2)
                                              ],
                                            ),
                                            child: ListTile(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      right: 20),
                                              tileColor: Colors.grey[100],
                                              trailing: Text(
                                                MyApp
                                                        .db
                                                        .monthlyPlans[index]
                                                            ['validity']
                                                        .toString() +
                                                    " \ndays",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              title: Text(
                                                MyApp.db.monthlyPlans[index]
                                                        ['per_day']
                                                    ? MyApp
                                                            .db
                                                            .monthlyPlans[index]
                                                                ['credits']
                                                            .toString() +
                                                        " \ncredits/day ⚡"
                                                    : MyApp
                                                            .db
                                                            .monthlyPlans[index]
                                                                ['credits']
                                                            .toString() +
                                                        " \ncredits ⚡",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              subtitle: Text(
                                                MyApp
                                                    .db
                                                    .monthlyPlans[index]
                                                        ['details']
                                                    .toString(),
                                                style: const TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  fontSize: 11,
                                                ),
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
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: MyApp.db.addonPlans.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(100.0),
                                      child: Text(
                                        "Pay ₹" +
                                            (MyApp.db.addonPlans[index]
                                                    ['amount'])
                                                .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Container(
                                        color: Colors.black,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "₹ " +
                                              MyApp.db
                                                  .addonPlans[index]['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[100]!,
                                              offset: const Offset(0, 0),
                                              spreadRadius: 2,
                                              blurRadius: 2)
                                        ],
                                      ),
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[100]!,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 2,
                                                blurRadius: 2)
                                          ],
                                        ),
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.only(right: 20),
                                          tileColor: Colors.grey[100],
                                          trailing: const Text(
                                            "Base plan\nvalidity",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          title: Text(
                                            MyApp
                                                    .db
                                                    .addonPlans[index]
                                                        ['credits']
                                                    .toString() +
                                                " \ncredits ⚡",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          subtitle: Text(
                                            MyApp
                                                .db.addonPlans[index]['details']
                                                .toString(),
                                            style: const TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
