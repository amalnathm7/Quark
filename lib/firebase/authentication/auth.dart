import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final _user = FirebaseAuth.instance.currentUser!;
      await _user.updateDisplayName(_user.email!.substring(0, 1).toUpperCase() + _user.email!.substring(1, _user.email!.indexOf('@')));
      return "";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  signOut() async {
    await _auth.signOut();
  }
}
