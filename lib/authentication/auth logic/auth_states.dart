import 'user_data.dart';
abstract class AuthStates {}

class GetOrCreateAccount extends AuthStates{}

class Authenticated extends AuthStates{
  UserData user;
  Authenticated(this.user);
}

class AuthErrors extends AuthStates{
  String? error;
  AuthErrors({required this.error,});
}
