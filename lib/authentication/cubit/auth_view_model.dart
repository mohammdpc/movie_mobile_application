import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie/authentication/cubit/auth_state.dart';
import 'package:movie/authentication/reset_password/reset_navigator.dart';
import '../../core/utils/firebase_utils.dart';
import '../../models/user_model.dart';
import '../Register/register_navigator.dart';
import '../login_screen/login_navigator.dart';

class AuthViewModel extends Cubit<AuthState>{
  AuthViewModel():super(AuthInitState());
  final loginFormKey = GlobalKey<FormState>();
  final resetFormKey = GlobalKey<FormState>();
  late LoginNavigator loginNavigator;
  late RegisterNavigator registerNavigator;
  late ResetNavigator resetNavigator;
  final registerFormKey = GlobalKey<FormState>();
  Future<void> registerAuth(String name,String email,String password,String phone,int avatarIndex,) async {
    try {
      emit(AuthLoadingState());
      registerNavigator.showMyLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email, password:password,);
      UserModel newUser = UserModel(
          id: credential.user?.uid ?? "",
          email: email,
          name: name, phone: phone,
          avatarIndex: avatarIndex,
          wishList: [],
          history: []
      );
      await FirebaseUtils.addUserToFireStore(newUser);
      registerNavigator.hideDialog();
      emit(AuthSuccessState(user: newUser));
      registerNavigator.showSuccess(message:"Registered Successfully");
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message =
          "weak password used";
          break;
        case 'email-already-in-use':
          message = "Same Email Already in Used";
          break;
        case 'invalid-email':
          message ="Invalid Email";
          break;
        default:
          message = e.message ??"Authentication Error";
      }
      registerNavigator.hideDialog();
      emit(AuthErrorState());
      registerNavigator.showError(message:message);
    }
  }
  Future<void> loginAuth(String email, String password) async {
    try {
      emit(AuthLoadingState());
      loginNavigator.showMyLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);
      var newUser = await FirebaseUtils.getUserFromFireStore(credential.user?.uid ?? "");
      if (newUser == null) {
        return;
      }
      loginNavigator.hideDialog();
      loginNavigator.showSuccess(message: "Logged In Successfully");
      emit(AuthSuccessState(user: newUser));
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = "User Not Found";
          break;
        case 'invalid-credential':
          message = "The email or password you entered is incorrect.";
          break;
        case 'invalid-email':
          message = "Invalid Email";
          break;
        default:
          message = e.message ?? "Authentication Error";
      }
      loginNavigator.hideDialog();
      emit(AuthErrorState());
      loginNavigator.showError(message:message);
    }
  }
  void deleteAccount(){
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    emit(AuthInitState());
  }
  Future<void> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      loginNavigator.showMyLoading();
      emit(AuthLoadingState());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(AuthInitState());
        loginNavigator.hideDialog();
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        UserModel? userDoc = await FirebaseUtils.getUserFromFireStore(user.uid);

        if (userDoc == null) {
          userDoc = UserModel(id: user.uid, name: user.displayName??"", email: user.email??"", phone: user.phoneNumber??"", avatarIndex: 1, wishList: [], history: []);
          await FirebaseUtils.addUserToFireStore(userDoc);
        }
        loginNavigator.hideDialog();
        emit(AuthSuccessState(user: userDoc));
        loginNavigator.showSuccess(message: "Signed In successfully");
      }
    } catch (e) {
      loginNavigator.hideDialog();
      emit(AuthErrorState());
      loginNavigator.showError(message:e.toString());
    }
  }
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      resetNavigator.showMyLoading();
      emit(AuthLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      resetNavigator.hideDialog();
      resetNavigator.showSuccess(message: "Password reset email sent successfully to $email");
      emit(AuthResetSuccessfullyState());
    } on FirebaseAuthException catch (e) {
      resetNavigator.hideDialog();
      resetNavigator.showError(message: "Error sending password reset email: ${e.message}");
      emit(AuthErrorState());
    } catch (e) {
      resetNavigator.hideDialog();
      resetNavigator.showError(message: "An unexpected error occurred: ${e.toString()}");
      emit(AuthErrorState());
    }
  }
}