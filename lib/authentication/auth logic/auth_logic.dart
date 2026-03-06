import 'package:bloc/bloc.dart';
import 'package:movie/authentication/auth%20logic/user_data.dart';
import 'auth_states.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthLogic extends Cubit<AuthStates> {
  int avatarIndex = 0;
  Authenticated? authenticatedState = Authenticated(
    UserData(uid: '', name: '', email: '', phone: '', avatarIndex: 0),
  );
  AuthLogic() : super(GetOrCreateAccount());

  Future<void> register({
    required String emailAddress,
    required String password,
    required String userName,
    required String phone,
    required int avatar,
    required BuildContext context,
  }) async {
    String? errors;
    String? userID;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      userID = credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      errors = e.code;
      emit(AuthErrors(error: errors));
      return;
    } catch (e) {
      errors = e.toString();
      emit(AuthErrors(error: errors));
      return;
    }

    final db = FirebaseFirestore.instance;
    db.collection('users').doc(userID).set({
      'User Name': userName,
      'Phone Number': phone,
      'Avatar Index': avatar,
    });
    authenticatedState = Authenticated(
      UserData(
        uid: userID,
        name: userName,
        email: emailAddress,
        phone: phone,
        avatarIndex: avatar,
      ),
    );
    debugPrint('\n\n ${authenticatedState!.user.name}\n\ns');

    debugPrint('\n\n db done \n\n');
    emit(authenticatedState!);
    return;
  }

  Future<void> logIn(String email, String password) async {
    String userID;
    String? errors;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userID = credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      errors = e.code;
      emit(AuthErrors(error: errors));
      return;
    }
    final db =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    avatarIndex = db['Avatar Index'];
    authenticatedState = Authenticated(
      UserData(
        uid: userID,
        name: db['User Name'],
        email: email,
        phone: db['Phone Number'],
        avatarIndex: avatarIndex,
      ),
    );
    emit(authenticatedState!);
  }
}

AuthLogic authLogic = AuthLogic();
