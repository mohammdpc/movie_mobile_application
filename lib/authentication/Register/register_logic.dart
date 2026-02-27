import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<Map<String,String?>> register({
  required String emailAddress,
  required String password,
  required String userName,
  required String phone,
  required int avatar,
  required BuildContext context,
}) async {
  Map<String,String?> output = {'email':null,'password':null,'error':null};
  String? userID;
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
    userID = credential.user!.uid;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
      output['password'] = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
      output['email'] = 'The account already exists for that email.';
    } else if (e.code.toUpperCase() == 'EMAIL_EXISTS'){
      output['email'] = 'The account already exists for that email.';
    } else{
      output['error'] = e.code;
    }
  } catch (e) {
    debugPrint(e.toString());
    output['error'] = e.toString();
  }
  final db = FirebaseFirestore.instance;
  db.collection('users').doc(userID).set({
    'User Name': userName,
    'Phone Number': phone,
    'Avatar Index' : avatar,
  });
  return output;
}
