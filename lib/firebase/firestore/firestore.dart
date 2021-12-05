import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Firestore extends ChangeNotifier {
  String category = "";
  DateTime today = DateTime.now();
  double todayUsage = 0;
  double monthUsage = 0;
  List<double> hourlyUsage = [0, 0, 0, 0, 0, 0, 0, 0];
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

          db.collection('add_on_plans').snapshots().listen((value) {
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
          remainingCredits = snapshot.get('remaining_credits');

          recommendedPlans.clear();
          snapshot.get('recommended_plans').forEach((DocumentReference ref) {
            ref.get().then((value) {
              recommendedPlans.add({
                'id': value.id,
                'amount': value.get('amount'),
                'details': value.get('details'),
                'validity': value.get('validity'),
                'credits': value.get('credits'),
              });
            });
          });

          notifyListeners();
        });
      }
    });
  }

  updatePlan(Map plan) {}
}
