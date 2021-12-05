import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> with TickerProviderStateMixin {
  final _user = FirebaseAuth.instance.currentUser!;
  bool _searchClicked = false;
  List monthlyPlans = [
    {
      'amount': 200,
      'details': 'Average 5 units per day at 120V.',
      'validity': 28,
      'credits': 140,
    },
    {
      'amount': 350,
      'details': 'Average 10 units per day at 120V.',
      'validity': 28,
      'credits': 280,
    },
    {
      'amount': 400,
      'details': 'Average 5 units per day at 120V.',
      'validity': 56,
      'credits': 280,
    },
    {
      'amount': 700,
      'details': 'Average 10 units per day at 120V.',
      'validity': 56,
      'credits': 560,
    },
    {
      'amount': 600,
      'details': 'Average 5 units per day at 120V.',
      'validity': 84,
      'credits': 420,
    },
    {
      'amount': 1050,
      'details': 'Average 10 units per day at 120V.',
      'validity': 84,
      'credits': 840,
    },
  ];

  List recommendedPlans = [
    {
      'amount': 200,
      'details': 'Average 5 units per day at 120V.',
      'validity': 28,
      'credits': 140,
    },
    {
      'amount': 400,
      'details': 'Average 5 units per day at 120V.',
      'validity': 56,
      'credits': 280,
    },
  ];

  List addonPlans = [
    {
      'amount': 50,
      'details': '25 units add-on credits at 120V.',
      'validity': 'Base plan',
      'credits': 25,
    },
    {
      'amount': 120,
      'details': '50 units add-on credits at 120V.',
      'validity': 'Base plan',
      'credits': 50,
    },
    {
      'amount': 250,
      'details': '100 units add-on credits at 120V.',
      'validity': 'Base plan',
      'credits': 100,
    },
    {
      'amount': 600,
      'details': '200 units add-on credits at 120V.',
      'validity': 'Base plan',
      'credits': 200,
    },
  ];

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
                        itemCount: recommendedPlans.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: SizedBox(
                                          child: Text(
                                            "Pay ₹ " +
                                                recommendedPlans[index]['amount']
                                                    .toString(),
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                          color: Colors.yellow[100],
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "₹ " +
                                                recommendedPlans[index]['amount']
                                                    .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
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
                                              recommendedPlans[index]['validity']
                                                      .toString() +
                                                  " \ndays",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                            title: Text(
                                              recommendedPlans[index]['credits']
                                                      .toString() +
                                                  " \ncredits ⚡",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                            subtitle: Text(
                                              recommendedPlans[index]['details']
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
                        itemCount: monthlyPlans.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: SizedBox(
                                        child: Text(
                                          "Pay ₹ " +
                                              monthlyPlans[index]['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                        color: Colors.yellow[100],
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "₹ " +
                                              monthlyPlans[index]['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
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
                                                monthlyPlans[index]['validity']
                                                        .toString() +
                                                    " \ndays",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              title: Text(
                                                monthlyPlans[index]['credits']
                                                        .toString() +
                                                    " \ncredits ⚡",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              subtitle: Text(
                                                monthlyPlans[index]['details']
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
                        itemCount: addonPlans.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: SizedBox(
                                        child: Text(
                                          "Pay ₹ " +
                                              addonPlans[index]['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                        color: Colors.yellow[100],
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "₹ " +
                                              addonPlans[index]['amount']
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
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
                                            addonPlans[index]['validity']
                                                    .toString() +
                                                " \nvalidity",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          title: Text(
                                            addonPlans[index]['credits']
                                                    .toString() +
                                                " \ncredits ⚡",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          subtitle: Text(
                                            addonPlans[index]['details']
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
