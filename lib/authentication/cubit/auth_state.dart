import 'package:movie/models/user_model.dart';

abstract class AuthState{}
class AuthInitState extends AuthState{}
class AuthSuccessState extends AuthState{
  UserModel user;
  AuthSuccessState({required this.user});
}
class AuthResetSuccessfullyState extends AuthState{}
class AuthLoadingState extends AuthState{}
class AuthErrorState extends AuthState{}