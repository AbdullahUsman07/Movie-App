import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/models/tvshowMode.dart';
import 'package:movie_app/screens/openingpage.dart';

class UserAuth {
  final _auth = FirebaseAuth.instance;

  Future<User?> registerUser(
    String email,
    String password,
    String username,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      cred.user!.updateDisplayName(username);
      // Get the user id
      String uid = cred.user!.uid;

      // store user data in cloud firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': username,
        'email': email,
        'profilepic': "", // will ask the user to update later
        'createdAt': FieldValue.serverTimestamp(),
      });

      // // creating a sub-collection(movies) within users collection to store the favourite movies
      // await FirebaseFirestore.instance.collection('users').doc(uid).collection('movies').doc('init').set({

      // });

      // // creating a sub-collection(shows) within the users collection to store the favourite tv shows
      // await FirebaseFirestore.instance.collection('users').doc(uid).collection('shows').doc('init').set({
      //   'message': 'Shows Collection added'
      // });

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

  Future<void> signout(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signOut(); // Ensure Firebase signs out the user

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen()),
        (route) => false,
      );
      Fluttertoast.showToast(msg: 'Sign Out Successful');
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong: ${e.toString()}");
    }
  }
}
