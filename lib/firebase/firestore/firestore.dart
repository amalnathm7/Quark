import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Firestore extends ChangeNotifier {
  String category = "";
  double todayUsage = 0;
  double monthUsage = 0;
  double baseAmount = 0;
  List<dynamic> hourlyUsage = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  int peakIndex = 0;
  Map<String, dynamic>? currentPlan;
  double remainingCredits = 0;
  List<Map<String, dynamic>> notifications = [];
  List<Map<String, dynamic>> recommendedPlans = [];
  List<Map<String, dynamic>> monthlyPlans = [];
  List<Map<String, dynamic>> addonPlans = [];
  List<Map<String, dynamic>> chargingStations = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  final User _user = FirebaseAuth.instance.currentUser!;

  listen() async {
    db.collection("users").doc(_user.uid).snapshots().listen((snapshot) async {
      if (snapshot.exists) {
        todayUsage = snapshot.get('today_usage');
        monthUsage = snapshot.get('month_usage');
        hourlyUsage = snapshot.get('hourly_usage');
        for (int i = 1; i < hourlyUsage.length; i++) {
          if (hourlyUsage[i] > hourlyUsage[peakIndex]) {
            peakIndex = i;
          }
        }

        notifyListeners();

        currentPlan = snapshot.get('current_plan');
        remainingCredits = snapshot.get('remaining_credits').toDouble();

        recommendedPlans.clear();
        snapshot.get('recommended_plans').forEach((ref) {
          ref.get().then((value) {
            recommendedPlans.add({
              'id': value.id,
              'amount': value.get('amount'),
              'details': value.get('details'),
              'validity': value.get('validity'),
              'credits': value.get('credits'),
              'per_day': value.get('per_day'),
            });
          });
        });

        category = snapshot.get('category');

        notifyListeners();

        db
            .collection(category == 'hospital'
                ? 'hospital_plans'
                : category == 'commercial'
                    ? 'commercial_plans'
                    : category == 'educational'
                        ? 'educational_plans'
                        : category == 'industrial'
                            ? 'industrial_plans'
                            : 'household_plans')
            .orderBy('amount')
            .snapshots()
            .listen((value) {
          monthlyPlans.clear();

          for (var element in value.docs) {
            monthlyPlans.add({
              'id': element.id,
              'amount': element.get('amount'),
              'details': element.get('details'),
              'validity': element.get('validity'),
              'credits': element.get('credits'),
              'per_day': element.get('per_day'),
            });
          }

          notifyListeners();

          db
              .collection('add_on_plans')
              .orderBy('amount')
              .snapshots()
              .listen((value) {
            addonPlans.clear();

            for (var element in value.docs) {
              addonPlans.add({
                'id': element.id,
                'amount': element.get('amount'),
                'details': element.get('details'),
                'credits': element.get('credits'),
              });
            }
          });

          notifyListeners();

          db
              .collection("base_charges")
              .doc(category)
              .snapshots()
              .listen((event) {
            baseAmount = event.get('amount').toDouble();
          });

          notifyListeners();
        });
      }
    });
  }

  updatePlan(Map plan) {}

  /* addData() {
    db.collection("users").doc(_user.uid).update({
      'category': 'household',
      'today_usage': 0.75,
      'month_usage': 12.35,
      'hourly_usage': [
        0.0,
        0.1,
        0.25,
        0.3,
        0.45,
        0.75,
        0.85,
        0.55,
      ],
      'current_plan': {
        'amount': 200,
        'validity': DateTime.now().add(const Duration(days: 28)),
        'credits': 140,
        'per_day': false,
      },
      'remaining_credits': 86,
      'recommended_plans': [
        db.collection("household_plans").doc("1gp8Y6f7D6j7MV1BgPGf"),
        db.collection("household_plans").doc("fRxutb9Jd0Bmj9m41a9b"),
        db.collection("household_plans").doc("oYLfUlsFNnAyNW0zAvjO"),
      ],
    });
  } */
}
