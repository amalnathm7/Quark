import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  signOut() async {
    await _auth.signOut();
  }
}