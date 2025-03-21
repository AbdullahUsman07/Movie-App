import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserAuth {
  final _auth = FirebaseAuth.instance;

  Future<User?> registerUser(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future<User?> signout() async {
    try {
      _auth.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
