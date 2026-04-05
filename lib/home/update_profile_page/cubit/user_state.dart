import '../../../models/movie_response.dart';

abstract class UserState{}
class UserInitiationState extends UserState{}
class UserLoadingState extends UserState{}
class UserErrorState extends UserState{
  String errorMessage;
  UserErrorState({this.errorMessage = ""});
}
class UserSuccessState extends UserState{}
class UserHistoryUpdatedSuccessState extends UserState{}
class UserWishListOrHistorySuccessState extends UserState{
  List<Movies> movies;
  UserWishListOrHistorySuccessState({required this.movies});
}
